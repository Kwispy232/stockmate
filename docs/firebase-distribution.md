# Firebase demo distribution

Firebase project: **[StockMate](https://console.firebase.google.com/project/stockmate-demo-kwispy/appdistribution)** (`stockmate-demo-kwispy`), owned by `sebastianmraz@gmail.com`. The app still uses Supabase for its hosted workspace. Firebase only distributes the binaries; no Firebase SDK or runtime configuration is required in Flutter.

## What runs

- A PR to `develop` or `main` checks generated files, formatting, analysis, unit/widget/signing-helper tests, and the isolated database.
- A push to either branch also builds the Android APK and iOS simulator ZIP and runs the native iOS integration test.
- With repository variable `FIREBASE_DISTRIBUTION_ENABLED=true`, a successful push additionally builds a signed universal Android APK and an Ad Hoc iPhone IPA, then uploads them through fastlane to the `demo-reviewers` Firebase group.
- Manual **Run workflow → distribute** runs the same verified distribution without merging. OIDC allows only `main`, `develop`, and the initial `codex/design-handoff` setup branch, from this repository's `demo.yml` workflow. Remove the setup branch from the provider condition after merging.
- A push to `main` publishes the existing GitHub demo prerelease after all requested jobs pass. Firebase stays optional when its enable flag is absent. A requested distribution with missing settings fails explicitly.

Signed artifacts remain in Actions for 14 days. Source/version/build number and SHA-256 manifests accompany them. The job summary links to the Firebase tester release. Integration diagnostics include verbose Flutter output, JSON test events, simulator logs, final screenshot, and available Runner crash reports; retained for 7 days.

## GitHub configuration

| Repository variable | Value / purpose |
| --- | --- |
| `FIREBASE_DISTRIBUTION_ENABLED` | `true` enables automatic uploads on pushes |
| `FIREBASE_PROJECT_ID` | `stockmate-demo-kwispy` (reference for maintainers) |
| `FIREBASE_ANDROID_APP_ID` | `1:842554023401:android:b00cfe5b828158617b7f78` |
| `FIREBASE_IOS_APP_ID` | `1:842554023401:ios:72af2060a8fa80b37b7f78` |
| `FIREBASE_TESTER_GROUPS` | `demo-reviewers` (comma-separated aliases supported) |
| `FIREBASE_SERVICE_ACCOUNT` | `github-distribution@stockmate-demo-kwispy.iam.gserviceaccount.com` |
| `FIREBASE_WORKLOAD_IDENTITY_PROVIDER` | `projects/842554023401/locations/global/workloadIdentityPools/github/providers/stockmate` |
| `IOS_TEAM_ID` | `K4UP28AX3Y` |

| GitHub secret | Contents |
| --- | --- |
| `ANDROID_KEYSTORE_BASE64` | Base64 of the dedicated demo JKS |
| `ANDROID_KEYSTORE_PASSWORD` | Keystore password |
| `ANDROID_KEY_ALIAS` | Alias inside the JKS |
| `ANDROID_KEY_PASSWORD` | Private key password |
| `IOS_CERTIFICATE_BASE64` | Base64 of the selected Apple Distribution identity exported as password-protected `.p12` |
| `IOS_CERTIFICATE_PASSWORD` | `.p12` export password |
| `IOS_PROFILE_BASE64` | Base64 of an unexpired Ad Hoc provisioning profile for this app/team, including tester UDIDs |

The service account has only `roles/firebaseappdistro.admin` on this project. GitHub impersonates it using short-lived OIDC credentials; there is no stored Google service-account key or personal Firebase token. The provider checks immutable repository/owner IDs plus workflow, event, and branch. Authentication runs immediately before the upload, after the build, so credentials are fresh.

Signing material is decoded only in an ephemeral runner directory. iOS uses a temporary keychain and validates the profile's team, application identifier, expiry, distribution entitlement, and registered devices. Cleanup restores the previous keychain list and removes the temporary profile and files, including after failure. Android Firebase builds use one stable signing key so subsequent demos can update existing installations. Older debug-signed APKs must be uninstalled once before installing the Firebase build.

## Invite reviewers

Add reviewers to **App Distribution → Testers & Groups → demo-reviewers** in the Firebase console. The group starts empty; a successful upload does not make the app public. Share the tester link from the workflow summary after adding the reviewers.

Android reviewers accept the Firebase invitation and permit installation from the browser/App Tester. We use an APK so this does not require a Google Play app. An AAB would require the Google Play integration.

On iPhone, reviewers accept the invitation in Safari and register their device with Firebase. Add the exported UDID to the Apple Developer team, regenerate the Ad Hoc profile, replace `IOS_PROFILE_BASE64`, and run distribution again. Firebase cannot bypass Apple's provisioning rules. No App Store listing or TestFlight setup is involved.

## Local fastlane commands

```sh
bundle install
bundle exec fastlane android firebase_build
bundle exec fastlane android distribute
bundle exec fastlane ios firebase_build
bundle exec fastlane ios distribute
```

For Android builds export `ANDROID_KEYSTORE_PATH`, `ANDROID_KEYSTORE_PASSWORD`, `ANDROID_KEY_ALIAS`, and `ANDROID_KEY_PASSWORD`. For iOS, install the distribution identity and Ad Hoc profile locally and set `IOS_TEAM_ID` and `IOS_PROFILE_NAME`. Upload lanes need `FIREBASE_APP_ID`, `FIREBASE_TESTER_GROUPS`, and ADC credentials or a local Firebase CLI login. Use `BUILD_NUMBER` to control the binary version. Do not run the runner-only `ci_signing.py` locally.

See the official [Firebase fastlane guide](https://firebase.google.com/docs/app-distribution/ios/distribute-fastlane), [tester setup](https://firebase.google.com/docs/app-distribution/ios/distribute-console), and [GitHub OIDC setup](https://github.com/google-github-actions/auth).
