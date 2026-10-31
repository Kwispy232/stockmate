#!/usr/bin/env python3
"""Install distribution signing material in an ephemeral GitHub runner."""
import argparse
import base64
from datetime import datetime, timezone
from fnmatch import fnmatchcase
import json
import os
from pathlib import Path
import plistlib
import secrets
import shlex
import shutil
import subprocess


BUNDLE_ID = 'dev.sebastianmraz.stockmate'


def setting(name):
    value = os.environ.get(name, '').strip()
    if not value:
        raise SystemExit(f'Missing signing setting: {name}')
    return value


def run(*args):
    result = subprocess.run(args, capture_output=True)
    if result.returncode:
        raise SystemExit(f'{args[0]} {args[1]} failed (exit {result.returncode}).')
    return result.stdout


def decode(name, path):
    path.write_bytes(base64.b64decode(setting(name), validate=True))
    path.chmod(0o600)


def export(name, value):
    if '\n' in value or '\r' in value:
        raise SystemExit(f'Invalid multiline signing setting: {name}')
    with Path(setting('GITHUB_ENV')).open('a') as env:
        env.write(f'{name}={value}\n')


def validate_profile(profile, team):
    if profile.get('TeamIdentifier') != [team]:
        raise ValueError('The provisioning profile belongs to a different Apple team.')
    entitlements = profile.get('Entitlements', {})
    if not fnmatchcase(f'{team}.{BUNDLE_ID}', entitlements.get('application-identifier', '')):
        raise ValueError('The provisioning profile does not authorize StockMate.')
    if entitlements.get('get-task-allow') or not profile.get('ProvisionedDevices'):
        raise ValueError('An Ad Hoc distribution profile with registered devices is required.')
    if profile.get('IsXcodeManaged'):
        raise ValueError('Create a manually managed Ad Hoc profile for CI in Apple Developer.')
    if profile['ExpirationDate'].replace(tzinfo=timezone.utc) <= datetime.now(timezone.utc):
        raise ValueError('The provisioning profile has expired.')
    return profile['UUID'], profile['Name']


def prepare(platform, directory):
    directory.mkdir(mode=0o700)
    if platform == 'android':
        path = directory / 'distribution.jks'
        decode('ANDROID_KEYSTORE_BASE64', path)
        export('ANDROID_KEYSTORE_PATH', str(path))
        return

    certificate = directory / 'distribution.p12'
    profile_path = directory / 'distribution.mobileprovision'
    decode('IOS_CERTIFICATE_BASE64', certificate)
    decode('IOS_PROFILE_BASE64', profile_path)
    profile = plistlib.loads(run('security', 'cms', '-D', '-i', str(profile_path)))
    uuid, name = validate_profile(profile, setting('IOS_TEAM_ID'))
    password = secrets.token_urlsafe(32)
    print(f'::add-mask::{password}')
    keychain = str(directory / 'signing.keychain-db')
    existing = shlex.split(run('security', 'list-keychains', '-d', 'user').decode())
    installed_profile = Path.home() / 'Library/Developer/Xcode/UserData/Provisioning Profiles' / f'{uuid}.mobileprovision'
    if installed_profile.exists():
        raise SystemExit('Refusing to replace an existing provisioning profile on this runner.')
    state = {'keychain': keychain, 'previousKeychains': existing, 'profile': str(installed_profile)}
    (directory / 'state.json').write_text(json.dumps(state))
    run('security', 'create-keychain', '-p', password, keychain)
    run('security', 'set-keychain-settings', '-lut', '21600', keychain)
    run('security', 'unlock-keychain', '-p', password, keychain)
    run('security', 'import', str(certificate), '-P', setting('IOS_CERTIFICATE_PASSWORD'),
        '-k', keychain, '-T', '/usr/bin/codesign', '-T', '/usr/bin/security')
    run('security', 'set-key-partition-list', '-S', 'apple-tool:,apple:,codesign:', '-k', password, keychain)
    run('security', 'list-keychains', '-d', 'user', '-s', keychain, *existing)
    installed_profile.parent.mkdir(parents=True, exist_ok=True)
    shutil.copyfile(profile_path, installed_profile)
    installed_profile.chmod(0o600)
    export('IOS_PROFILE_NAME', name)
    certificate.unlink()
    profile_path.unlink()


def cleanup(directory):
    state_path = directory / 'state.json'
    if state_path.exists():
        state = json.loads(state_path.read_text())
        run('security', 'list-keychains', '-d', 'user', '-s', *state['previousKeychains'])
        subprocess.run(['security', 'delete-keychain', state['keychain']], capture_output=True)
        Path(state['profile']).unlink(missing_ok=True)
    shutil.rmtree(directory, ignore_errors=True)


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('action', choices=['prepare', 'cleanup'])
    parser.add_argument('platform', choices=['android', 'ios'])
    args = parser.parse_args()
    if os.environ.get('GITHUB_ACTIONS') != 'true':
        parser.error('This helper only modifies signing settings on GitHub Actions runners.')
    directory = Path(setting('RUNNER_TEMP')) / f'stockmate-signing-{args.platform}'
    try:
        prepare(args.platform, directory) if args.action == 'prepare' else cleanup(directory)
    except (ValueError, KeyError) as error:
        raise SystemExit(str(error)) from None
