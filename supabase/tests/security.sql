begin;

insert into auth.users(id, email) values
  ('90000000-0000-4000-8000-000000000001', 'stockmate-test-a@example.invalid'),
  ('90000000-0000-4000-8000-000000000002', 'stockmate-test-b@example.invalid');

set local role authenticated;
select set_config('request.jwt.claims', '{"sub":"90000000-0000-4000-8000-000000000001","role":"authenticated"}', true);

do $$
declare
  payload jsonb;
  inventory uuid := '30000000-0000-4000-8000-000000000001';
  branch uuid := '10000000-0000-4000-8000-000000000001';
begin
  if (select count(*) from public.branches) <> 2
      or (select count(*) from public.catalog_items) <> 60 then
    raise exception 'Membership/catalog visibility failed';
  end if;
  select jsonb_agg(jsonb_build_object('product_id', id, 'expected', expected, 'counted', expected))
    into payload from public.catalog_items where branch_id = branch;
  perform public.submit_inventory(inventory, branch, 'Security test', '2026-10-30T12:00:00Z', payload);
  perform public.submit_inventory(inventory, branch, 'Security test', '2026-10-30T12:00:00Z', payload);
  if (select count(*) from public.inventories) <> 1
      or (select count(*) from public.inventory_lines) <> 30 then
    raise exception 'Atomic/idempotent submission failed';
  end if;
  begin
    perform public.submit_inventory(inventory, branch, 'Changed', '2026-10-30T12:00:00Z', payload);
    raise exception 'Changed retry was accepted';
  exception when invalid_parameter_value then
    if sqlerrm <> 'submission_changed' then raise; end if;
  end;
  begin
    update public.inventories set title = 'Tampered' where id = inventory;
    raise exception 'Submitted inventory was mutable';
  exception when insufficient_privilege then null;
  end;
  begin
    perform public.submit_inventory('30000000-0000-4000-8000-000000000002', branch,
      'Incomplete', now(), jsonb_build_array(payload->0));
    raise exception 'Incomplete submission was accepted';
  exception when invalid_parameter_value then
    if sqlerrm <> 'stale_catalog' then raise; end if;
  end;
  begin
    perform public.submit_inventory('30000000-0000-4000-8000-000000000003', branch,
      'Negative', now(), jsonb_set(payload, '{0,counted}', '-1'));
    raise exception 'Negative count was accepted';
  exception when invalid_parameter_value then null;
  end;
  if (select count(*) from public.inventories) <> 1 then
    raise exception 'Rejected requests left partial writes';
  end if;
end;
$$;

select set_config('request.jwt.claims', '{"sub":"90000000-0000-4000-8000-000000000002","role":"authenticated"}', true);

do $$
declare payload jsonb;
begin
  if exists (select 1 from public.inventories) or exists (select 1 from public.inventory_lines) then
    raise exception 'Another user can read private submissions';
  end if;
  select jsonb_agg(jsonb_build_object('product_id', id, 'expected', expected, 'counted', expected))
    into payload from public.catalog_items where branch_id = '10000000-0000-4000-8000-000000000001';
  begin
    perform public.submit_inventory('30000000-0000-4000-8000-000000000001',
      '10000000-0000-4000-8000-000000000001', 'Security test', '2026-10-30T12:00:00Z', payload);
    raise exception 'Another user reused a private submission ID';
  exception when insufficient_privilege then null;
  end;
  begin
    insert into public.branch_members values
      ('90000000-0000-4000-8000-000000000002', '10000000-0000-4000-8000-000000000001');
    raise exception 'Client changed membership';
  exception when insufficient_privilege then null;
  end;
  begin
    perform public.submit_inventory('30000000-0000-4000-8000-000000000004',
      '10000000-0000-4000-8000-000000000099', 'Other branch', now(), payload);
    raise exception 'Unassigned branch accepted a submission';
  exception when insufficient_privilege then null;
  end;
end;
$$;

set local role anon;
select set_config('request.jwt.claims', '{}', true);
do $$
begin
  begin
    perform * from public.branches;
    raise exception 'Anonymous client read the catalogue';
  exception when insufficient_privilege then null;
  end;
end;
$$;

rollback;
