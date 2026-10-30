# Implementation plan

## 0. Repository and hosted backend

Create the public repository, ignore local/generated files, create a separate Supabase demo project, and record non-secret project identifiers. No application schema or screens yet.

## 1. Flutter foundation

Create Android/iOS targets, pin the SDK and dependencies, configure formatting and analysis, and add the application entry point. Establish feature-first folders as source files need them. Document one-command local demo startup.

## 2. Models and domain rules

Model products, inventory drafts, count lines, stock snapshots, and submission status. Define count validation and difference calculations. Add focused pure Dart tests. Use code generation for immutable models/JSON only where worthwhile.

## 3. Data and networking

Add Drift persistence, a repository boundary, isolated demo data, Supabase auth/API access, schema migrations, and RLS. Save drafts and pending submissions transactionally. Use a stable submission ID and server-side uniqueness/atomic handling for safe retries. Add persistence and repository tests, including restart and duplicate-submission cases.

The initial scope allows the author to edit their own draft. Submitted counts are immutable. Collaborative editing of the same inventory is deferred.

## 4. UI and routing

Add go_router and Riverpod controllers, then inventory list/detail, scanning/manual lookup, review/submit, and settings. Implement Slovak/English ARB resources, SVG assets, light/dark themes, and adaptive Cupertino/Material controls and navigation. Cover loading, empty, offline, denied-camera, and error states. Add targeted widget tests alongside the UI.

## 5. Integrated verification

Exercise the whole workflow: create draft, record counts offline, restart, reconnect, submit, and retry. Verify server access boundaries, platform navigation, large text, and localization. Consolidate tests and document how to run them. Earlier stages already include tests for their own behavior.

## 6. GitHub delivery

Add GitHub Actions and fastlane lanes. PRs run formatting, analysis, and tests. Develop publishes build artifacts. Main publishes a GitHub demo release with an Android APK and an iOS simulator archive, tied to the source commit. Skip App Store Connect, Google Play, store signing, and store review configuration.

## Architecture

Feature-first describes file organization. Clean Architecture describes dependency direction. They can be used together.

```text
lib/
  app/                       # bootstrap and router
  core/                      # shared infrastructure and adaptive components
  features/
    inventory/
      domain/                # pure Dart models and rules
      data/                  # local/remote sources and repository implementation
      application/           # Riverpod controllers and workflow coordination
      presentation/          # screens and widgets
    auth/
    settings/
  l10n/
```

Domain rules do not import Flutter, Riverpod, Drift, or Supabase. Widgets do not call the database or backend. Riverpod wires dependencies. Repository contracts live with the model/domain boundary when local-demo and live implementations need them. A dedicated use case is justified by real orchestration, not by every read/write operation.

## Concise Dart

Use standard Dart syntax, small widgets, expression bodies, constructor parameters such as `this.id`, pattern matching, and inferred local types. Let formatting handle punctuation and layout. Freezed/JSON generation may remove repetitive equality, copy, and serialization code. Do not introduce a custom syntax layer or broad widget-extension DSL.

## Platform conventions

Use Cupertino navigation, forms, dialogs, and controls on iOS, and Material equivalents on Android. Share content and state, with a small adaptive component layer for genuine differences. Flutter draws these widgets; it does not turn them into UIKit or Android View controls. Exact OS visual parity is not assumed.
