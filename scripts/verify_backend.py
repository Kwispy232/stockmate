#!/usr/bin/env python3
"""Exercise the hosted API with temporary users, then remove their accounts."""
import json
import secrets
import subprocess
import urllib.error
import urllib.request
import uuid

project = 'jjtkjkiimohgrpqmvuni'
base = f'https://{project}.supabase.co'
result = subprocess.run(['supabase', 'projects', 'api-keys', '--project-ref', project, '--output', 'json'],
                        capture_output=True, text=True, check=True)
keys = json.loads(result.stdout)
admin_key = next(key['api_key'] for key in keys if key['name'] == 'service_role')
public_key = next(key['api_key'] for key in keys if key.get('type') == 'publishable')
users = []

def request(method, path, data=None, token=None, admin=False, expected=200):
    key = admin_key if admin else public_key
    headers = {'apikey': key, 'Content-Type': 'application/json'}
    if token or admin:
        headers['Authorization'] = f'Bearer {admin_key if admin else token}'
    body = None if data is None else json.dumps(data).encode()
    try:
        response = urllib.request.urlopen(urllib.request.Request(base + path, data=body, headers=headers, method=method), timeout=30)
        status, payload = response.status, response.read()
    except urllib.error.HTTPError as error:
        status, payload = error.code, error.read()
    if status != expected:
        raise RuntimeError(f'{method} {path}: expected HTTP {expected}, received {status}')
    return json.loads(payload) if payload else None

try:
    tokens = []
    for _ in range(2):
        email = f'stockmate-check-{uuid.uuid4().hex}@example.invalid'
        password = secrets.token_urlsafe(32)
        registration = request('POST', '/auth/v1/signup', {'email': email, 'password': password})
        users.append(registration['user']['id'])
        assert registration.get('access_token'), 'Demo signup must return a session without SMTP.'
        session = request('POST', '/auth/v1/token?grant_type=password', {'email': email, 'password': password})
        tokens.append(session['access_token'])

    token = tokens[0]
    branches = request('GET', '/rest/v1/branches?select=*', token=token)
    assert len(branches) == 2
    branch = branches[0]['id']
    products = request('GET', f'/rest/v1/catalog_items?branch_id=eq.{branch}&select=*', token=token)
    assert len(products) == 30
    inventory_id = str(uuid.uuid4())
    submission = {'p_id': inventory_id, 'p_branch_id': branch, 'p_title': 'HTTP verification',
                  'p_created_at': '2026-10-30T12:00:00Z',
                  'p_lines': [{'product_id': p['id'], 'expected': p['expected'], 'counted': 0} for p in products]}
    for _ in range(2):
        assert request('POST', '/rest/v1/rpc/submit_inventory', submission, token=token) == inventory_id
    rows = request('GET', '/rest/v1/inventories?select=*,inventory_lines(*)', token=token)
    assert len(rows) == 1 and len(rows[0]['inventory_lines']) == 30
    assert request('GET', '/rest/v1/inventories?select=*', token=tokens[1]) == []
    request('POST', '/rest/v1/rpc/submit_inventory', submission, token=tokens[1], expected=403)
    request('PATCH', f'/rest/v1/inventories?id=eq.{inventory_id}', {'title': 'Tampered'}, token=token, expected=403)
    request('GET', '/rest/v1/branches?select=*', expected=401)
    print('PASS: public signup, password sign-in, membership, atomic submit, safe retry, RLS isolation, immutable submissions, and anonymous denial.')
finally:
    for user_id in users:
        request('DELETE', f'/auth/v1/admin/users/{user_id}', admin=True)
    print(f'Removed {len(users)} temporary verification accounts.')
