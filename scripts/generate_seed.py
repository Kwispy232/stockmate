#!/usr/bin/env python3
import json
from pathlib import Path

root = Path(__file__).resolve().parents[1]
catalog = json.loads((root / 'assets/demo/catalog.json').read_text())

def literal(value):
    return str(value) if isinstance(value, int) else "'" + value.replace("'", "''") + "'"

statements = []
for branch in catalog['branches']:
    values = ', '.join(literal(branch[key]) for key in ['id', 'name'])
    statements.append(f'insert into public.branches(id, name) values ({values}) on conflict (id) do nothing;')
for product in catalog['products']:
    values = ', '.join(literal(product[key]) for key in ['id', 'branchId', 'name', 'sku', 'barcode', 'category', 'expected'])
    statements.append('insert into public.catalog_items(id, branch_id, name, sku, barcode, category, expected) '
                      f'values ({values}) on conflict (id) do nothing;')
(root / 'supabase/seed.sql').write_text('\n'.join(statements) + '\n')
