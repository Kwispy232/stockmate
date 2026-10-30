create schema if not exists private;

create table public.branches (
  id uuid primary key,
  name text not null check (char_length(name) between 1 and 80)
);

create table public.branch_members (
  user_id uuid not null references auth.users(id) on delete cascade,
  branch_id uuid not null references public.branches(id) on delete cascade,
  primary key (user_id, branch_id)
);
create index branch_members_branch_idx on public.branch_members(branch_id);

create table public.catalog_items (
  id uuid primary key,
  branch_id uuid not null references public.branches(id),
  name text not null,
  sku text not null,
  barcode text not null,
  category text not null,
  expected integer not null check (expected between 0 and 1000000),
  unique (branch_id, barcode)
);

create table public.inventories (
  id uuid primary key,
  author_id uuid not null references auth.users(id) on delete cascade,
  branch_id uuid not null references public.branches(id),
  title text not null check (char_length(btrim(title)) between 1 and 80),
  created_at timestamptz not null,
  submitted_at timestamptz not null default now(),
  request_hash text not null
);
create index inventories_author_idx on public.inventories(author_id, created_at desc);
create index inventories_branch_idx on public.inventories(branch_id);

create table public.inventory_lines (
  inventory_id uuid not null references public.inventories(id) on delete cascade,
  product_id uuid not null references public.catalog_items(id),
  name text not null,
  sku text not null,
  barcode text not null,
  expected integer not null check (expected between 0 and 1000000),
  counted integer not null check (counted between 0 and 1000000),
  primary key (inventory_id, product_id)
);
create index inventory_lines_product_idx on public.inventory_lines(product_id);

alter table public.branches enable row level security;
alter table public.branch_members enable row level security;
alter table public.catalog_items enable row level security;
alter table public.inventories enable row level security;
alter table public.inventory_lines enable row level security;

create policy own_memberships on public.branch_members for select to authenticated
  using (user_id = (select auth.uid()));
create policy member_branches on public.branches for select to authenticated
  using (id in (select branch_id from public.branch_members where user_id = (select auth.uid())));
create policy member_catalog on public.catalog_items for select to authenticated
  using (branch_id in (select branch_id from public.branch_members where user_id = (select auth.uid())));
create policy own_inventories on public.inventories for select to authenticated
  using (author_id = (select auth.uid()) and branch_id in (
    select branch_id from public.branch_members where user_id = (select auth.uid())
  ));
create policy own_lines on public.inventory_lines for select to authenticated
  using (inventory_id in (select id from public.inventories where author_id = (select auth.uid())));

revoke all on public.branches, public.branch_members, public.catalog_items,
  public.inventories, public.inventory_lines from anon, authenticated;
grant select on public.branches, public.branch_members, public.catalog_items,
  public.inventories, public.inventory_lines to authenticated;
grant usage on schema private to authenticated;

create function private.submit_inventory(
  p_id uuid, p_branch_id uuid, p_title text, p_created_at timestamptz, p_lines jsonb
) returns uuid language plpgsql security definer set search_path = '' as $$
declare
  actor uuid := auth.uid();
  fingerprint text;
  existing public.inventories;
begin
  if actor is null or not exists (
    select 1 from public.branch_members where user_id = actor and branch_id = p_branch_id
  ) then raise exception 'access_denied' using errcode = '42501'; end if;
  if p_id is null or p_created_at is null or p_title is null
      or char_length(btrim(p_title)) not between 1 and 80
      or p_lines is null or jsonb_typeof(p_lines) <> 'array'
      or jsonb_array_length(p_lines) not between 1 and 1000 then
    raise exception 'invalid_submission' using errcode = '22023';
  end if;

  select encode(extensions.digest(jsonb_build_object(
    'branch', p_branch_id, 'title', btrim(p_title), 'created', p_created_at,
    'lines', (select jsonb_agg(value order by value->>'product_id') from jsonb_array_elements(p_lines))
  )::text, 'sha256'), 'hex') into fingerprint;
  perform pg_advisory_xact_lock(hashtextextended(p_id::text, 0));
  select * into existing from public.inventories where id = p_id;
  if found then
    if existing.author_id <> actor then
      raise exception 'access_denied' using errcode = '42501';
    end if;
    if existing.request_hash <> fingerprint then
      raise exception 'submission_changed' using errcode = '22023';
    end if;
    return p_id;
  end if;

  if exists (
    select 1 from jsonb_to_recordset(p_lines) as line(product_id uuid, expected integer, counted integer)
    left join public.catalog_items product on product.id = line.product_id
    where product.id is null or product.branch_id <> p_branch_id
      or line.expected is null or line.expected <> product.expected
      or line.counted is null or line.counted not between 0 and 1000000
  ) or (select count(distinct value->>'product_id') from jsonb_array_elements(p_lines))
       <> jsonb_array_length(p_lines)
    or jsonb_array_length(p_lines) <> (select count(*) from public.catalog_items where branch_id = p_branch_id)
  then raise exception 'stale_catalog' using errcode = '22023'; end if;

  insert into public.inventories(id, author_id, branch_id, title, created_at, request_hash)
    values (p_id, actor, p_branch_id, btrim(p_title), p_created_at, fingerprint);
  insert into public.inventory_lines(inventory_id, product_id, name, sku, barcode, expected, counted)
    select p_id, product.id, product.name, product.sku, product.barcode, line.expected, line.counted
    from jsonb_to_recordset(p_lines) as line(product_id uuid, expected integer, counted integer)
    join public.catalog_items product on product.id = line.product_id;
  return p_id;
end;
$$;

create function public.submit_inventory(
  p_id uuid, p_branch_id uuid, p_title text, p_created_at timestamptz, p_lines jsonb
) returns uuid language sql security invoker set search_path = '' as $$
  select private.submit_inventory(p_id, p_branch_id, p_title, p_created_at, p_lines);
$$;
revoke all on function private.submit_inventory(uuid, uuid, text, timestamptz, jsonb) from public, anon;
revoke all on function public.submit_inventory(uuid, uuid, text, timestamptz, jsonb) from public, anon;
grant execute on function private.submit_inventory(uuid, uuid, text, timestamptz, jsonb) to authenticated;
grant execute on function public.submit_inventory(uuid, uuid, text, timestamptz, jsonb) to authenticated;

create function private.enroll_demo_user() returns trigger
language plpgsql security definer set search_path = '' as $$
begin
  insert into public.branch_members(user_id, branch_id)
    select new.id, id from public.branches where id in (
      '10000000-0000-4000-8000-000000000001', '10000000-0000-4000-8000-000000000002'
    );
  return new;
end;
$$;
revoke all on function private.enroll_demo_user() from public, anon, authenticated;
create trigger enroll_stockmate_demo_user after insert on auth.users
  for each row execute function private.enroll_demo_user();
