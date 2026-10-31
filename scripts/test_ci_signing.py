import base64
from copy import deepcopy
from datetime import datetime, timedelta, timezone
import os
from pathlib import Path
import tempfile
import plistlib
import unittest
from unittest.mock import patch

import ci_signing as signing


class SigningTests(unittest.TestCase):
    def setUp(self):
        self.profile = {
            'TeamIdentifier': ['TEAM123'], 'UUID': 'profile-id', 'Name': 'StockMate demo',
            'Entitlements': {'application-identifier': 'TEAM123.dev.sebastianmraz.stockmate', 'get-task-allow': False},
            'ProvisionedDevices': ['test-device'],
            'ExpirationDate': datetime.now(timezone.utc) + timedelta(days=30),
        }

    def test_rejects_wrong_team_app_development_expired_and_device_free_profiles(self):
        invalid = []
        for key, value in [('TeamIdentifier', ['OTHER']), ('ProvisionedDevices', []),
                           ('ExpirationDate', datetime.now(timezone.utc) - timedelta(days=1))]:
            profile = deepcopy(self.profile)
            profile[key] = value
            invalid.append(profile)
        for key, value in [('application-identifier', 'TEAM123.com.other.app'), ('get-task-allow', True)]:
            profile = deepcopy(self.profile)
            profile['Entitlements'][key] = value
            invalid.append(profile)
        for profile in invalid:
            with self.subTest(profile=profile), self.assertRaises(ValueError):
                signing.validate_profile(profile, 'TEAM123')
        self.assertEqual(signing.validate_profile(self.profile, 'TEAM123'), ('profile-id', 'StockMate demo'))

    def test_android_signing_is_private_and_cleanup_only_removes_its_directory(self):
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary)
            directory = root / 'signing'
            sibling = root / 'keep'
            sibling.write_text('unrelated file')
            env_file = root / 'github-env'
            with patch.dict(os.environ, {'ANDROID_KEYSTORE_BASE64': base64.b64encode(b'keystore').decode(), 'GITHUB_ENV': str(env_file)}):
                signing.prepare('android', directory)
            path = directory / 'distribution.jks'
            self.assertEqual(path.read_bytes(), b'keystore')
            self.assertEqual(path.stat().st_mode & 0o777, 0o600)
            self.assertEqual(env_file.read_text(), f'ANDROID_KEYSTORE_PATH={path}\n')
            signing.cleanup(directory)
            self.assertFalse(directory.exists())
            self.assertTrue(sibling.exists())

    def test_malformed_secret_and_multiline_exports_are_rejected(self):
        with tempfile.TemporaryDirectory() as temporary:
            with patch.dict(os.environ, {'BAD': 'not base64!'}), self.assertRaises(ValueError):
                signing.decode('BAD', Path(temporary) / 'secret')
            with self.assertRaises(SystemExit):
                signing.export('PROFILE', 'valid\nINJECTED=value')

    def test_existing_ios_profile_is_never_overwritten_or_deleted_on_failure(self):
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary)
            profile = root / 'Library/Developer/Xcode/UserData/Provisioning Profiles/profile-id.mobileprovision'
            profile.parent.mkdir(parents=True)
            profile.write_bytes(b'preexisting profile')
            directory = root / 'signing'
            payload = plistlib.dumps(self.profile)
            with patch.object(Path, 'home', return_value=root), patch.object(signing, 'run', side_effect=[payload, b'"login.keychain-db"']), patch.dict(os.environ, {
                'IOS_CERTIFICATE_BASE64': base64.b64encode(b'certificate').decode(),
                'IOS_PROFILE_BASE64': base64.b64encode(payload).decode(),
                'IOS_TEAM_ID': 'TEAM123',
            }), self.assertRaises(SystemExit):
                signing.prepare('ios', directory)
            signing.cleanup(directory)
            self.assertEqual(profile.read_bytes(), b'preexisting profile')


if __name__ == '__main__':
    unittest.main()
