# Validation

Observed locally on 30 October 2026 with Flutter 3.47.9 / Dart 3.13.7, Xcode 27.0, Ruby 3.4.7, and fastlane 2.241.2.

| Check | Observed result |
| --- | --- |
| Formatting, generated output and analysis | Passed |
| 18 domain, file-backed repository and adaptive widget tests | Passed; includes restart, disk-write failure, retry identity, independent queue failures and workspace exit |
| Native integration | Passed on a dedicated iPhone 18 Pro / iOS 27.0 simulator; offline queue and reconnection |
| Hosted SQL assertions | Passed in a rolled-back transaction |
| Hosted Auth/REST check | Passed with two public signups and password sign-ins; accounts and submissions removed afterward |
| Supabase security advisor | No issues reported after schema deployment |
| Android fastlane lane | Produced an installable ARM64 release APK |
| iOS fastlane lane | Produced an unsigned debug simulator archive; Runner contains arm64 and x86_64 |
| Artifact provenance | Both SHA-256 hashes match their platform manifests |
| Workflow/shell syntax | actionlint and shellcheck passed |

The iOS preview in the README was captured from the actual simulator app. Hosted checks exercised authenticated catalogue access, atomic submission, identical retries, cross-user isolation, immutability, and anonymous denial.

The GitHub workflow repeats source checks and the SQL assertions in an isolated local backend, builds both platforms through fastlane, and runs the native iOS integration test. See [live workflow runs](https://github.com/Kwispy232/stockmate/actions/workflows/demo.yml) and [demo releases](https://github.com/Kwispy232/stockmate/releases) for server-side results and source-bound artifacts.

Physical camera scanning has not been device-qualified. The simulator can use product search or the scanner's manual barcode fallback. The Android build was compiled locally; the automated native device workflow currently targets iOS. See the README for the deliberate demo limits around background execution, shared sample catalogues, and remote history size.
