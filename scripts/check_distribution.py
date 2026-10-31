#!/usr/bin/env python3
"""Fail early when Firebase distribution is requested without its configuration."""
import os


required = [
    'FIREBASE_WORKLOAD_IDENTITY_PROVIDER', 'FIREBASE_SERVICE_ACCOUNT',
    'FIREBASE_ANDROID_APP_ID', 'FIREBASE_IOS_APP_ID', 'FIREBASE_TESTER_GROUPS',
    'ANDROID_KEYSTORE_BASE64', 'ANDROID_KEYSTORE_PASSWORD', 'ANDROID_KEY_ALIAS',
    'ANDROID_KEY_PASSWORD', 'IOS_CERTIFICATE_BASE64', 'IOS_CERTIFICATE_PASSWORD',
    'IOS_PROFILE_BASE64', 'IOS_TEAM_ID',
]
missing = [name for name in required if not os.environ.get(name, '').strip()]
if missing:
    raise SystemExit('Firebase distribution is not configured. Missing: ' + ', '.join(missing))
print('Firebase distribution configuration is present for Android and iOS.')
