# StockMate

A Flutter portfolio app for counting retail stock, saving work offline, and submitting inventory counts reliably.

Status: public repository and hosted Supabase project created. The Flutter application will be implemented in small, reviewable stages.

## Planned experience

- Scan a barcode or find a product manually.
- Record quantities and resume drafts after restarting the app.
- Compare counted quantities with the expected stock snapshot.
- Submit counts with retries that cannot create duplicates.
- Explore an isolated local demo without an account.
- Use Cupertino conventions on iOS and Material conventions on Android, in Slovak or English.

## Selected stack

Flutter and Dart, Riverpod, go_router, Drift/SQLite, Supabase, Flutter gen_l10n/ARB, flutter_svg, and mobile_scanner. Dependencies and SDK versions will be pinned during Flutter setup.

Features group related code. UI, state, domain rules, and persistence remain separate within each feature, with extra layers introduced only when useful.

## Delivery

GitHub Actions and fastlane will validate the project and publish demo artifacts through GitHub. Android gets an installable demo APK; iOS gets a simulator build. App Store and Google Play configuration are outside this portfolio project's scope.

See [the implementation plan](docs/implementation-plan.md) for stage boundaries, architecture decisions, and testing.

See [backend setup](supabase/README.md) for the demo project's public identifiers and local linking instructions.
