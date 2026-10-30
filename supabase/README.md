# Demo backend

| Setting | Value |
| --- | --- |
| Project | `stockmate-demo` |
| Project reference | `jjtkjkiimohgrpqmvuni` |
| Region | `eu-central-1` (Frankfurt) |
| API URL | `https://jjtkjkiimohgrpqmvuni.supabase.co` |
| Dashboard | https://supabase.com/dashboard/project/jjtkjkiimohgrpqmvuni |

The hosted project is linked, migrated, and seeded. Authenticated users receive membership in the two sample stores. RLS restricts catalogue access to members and submissions to their author. Clients have no direct write grants on exposed tables; submission goes through a checked atomic RPC.

## Link another checkout

Install the Supabase CLI and authenticate with `supabase login`, then run from the repository root:

```sh
supabase link --project-ref jjtkjkiimohgrpqmvuni
```

The CLI may request the database password. It is not part of the public repository. The original checkout stores the generated password in an ignored, owner-only `.private/supabase-db-password` file. CLI link metadata in `.temp/` also stays untracked.

`config.toml` configures the local development stack. Auth configuration was also pushed explicitly to the demo project; confirmation links return to this repository. Local resets apply `seed.sql`, generated from the same fixture bundled in the app.

The Flutter client uses the publishable key. Database passwords, management tokens, and service-role keys must never enter app configuration or Git history. Every exposed application table has RLS enabled.

## Verify

```sh
supabase start
supabase db reset --local
bash scripts/check-backend.sh
```

The SQL checks run inside a rolled-back transaction. They verify membership, complete/atomic submission, idempotent retries, changed-payload rejection, immutability, invalid quantities, cross-user isolation, branch denial, and anonymous denial. CI runs these against an isolated local stack without production credentials.

With authenticated management CLI access, `python3 scripts/verify_backend.py` checks the hosted Auth and REST APIs with two temporary accounts and removes them afterward. It keeps privileged keys in memory and never writes them into app files or prints them.

To deploy migrations to another project, initialize it, link its ref, run `supabase db push --linked`, and apply `seed.sql`. The app accepts `SUPABASE_URL` and `SUPABASE_PUBLISHABLE_KEY` through `--dart-define`.
