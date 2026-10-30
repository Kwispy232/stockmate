#!/usr/bin/env python3
import json
import re
import subprocess

sdk = subprocess.check_output(['xcrun', '--sdk', 'iphonesimulator', '--show-sdk-version'], text=True).strip()
sdk_version = tuple(int(part) for part in sdk.split('.')[:2])
devices = json.loads(subprocess.check_output(['xcrun', 'simctl', 'list', 'devices', 'available', '-j']))['devices']
candidates = []
for runtime, phones in devices.items():
    match = re.search(r'iOS-(\d+)-(\d+)', runtime)
    if not match:
        continue
    version = tuple(map(int, match.groups()))
    if version > sdk_version:
        continue
    for phone in phones:
        if 'iPhone' in phone['name']:
            candidates.append((version, phone['state'] == 'Booted', phone['udid']))
if not candidates:
    raise SystemExit(f'No available iPhone simulator for SDK {sdk}')
print(max(candidates)[2])
