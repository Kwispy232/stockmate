# Demo backend

| Setting | Value |
| --- | --- |
| Project | `stockmate-demo` |
| Project reference | `jjtkjkiimohgrpqmvuni` |
| Region | `eu-central-1` (Frankfurt) |
| API URL | `https://jjtkjkiimohgrpqmvuni.supabase.co` |
| Dashboard | https://supabase.com/dashboard/project/jjtkjkiimohgrpqmvuni |

The hosted project is created and this checkout is linked. Application tables, migrations, auth flows, and seed data will be added in the data/networking stage.

## Link another checkout

Install the Supabase CLI and authenticate with `supabase login`, then run from the repository root:

```sh
supabase link --project-ref jjtkjkiimohgrpqmvuni
```

The CLI may request the database password. It is not part of the public repository. The original checkout stores the generated password in an ignored, owner-only `.private/supabase-db-password` file. CLI link metadata in `.temp/` also stays untracked.

`config.toml` configures the local development stack; linking does not deploy that configuration to the hosted project. Local seeding is disabled until a seed file exists.

Use the publishable key for the future Flutter client. Database passwords, management tokens, and service-role keys must never enter app configuration or Git history. Add RLS policies with the first exposed application tables.
