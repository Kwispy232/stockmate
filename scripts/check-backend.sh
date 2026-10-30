#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."

docker exec -i supabase_db_stockmate psql -X -U postgres -d postgres -v ON_ERROR_STOP=1 < supabase/tests/security.sql
