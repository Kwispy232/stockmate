#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
python3 -m unittest discover -s scripts -p 'test_*.py'

dart run build_runner build
flutter gen-l10n
python3 scripts/generate_seed.py
git diff --exit-code -- lib supabase/seed.sql
git ls-files -z '*.dart' ':!:*.g.dart' ':!:*.freezed.dart' ':!:lib/l10n/app_localizations*.dart' |
  xargs -0 dart format --output=none --set-exit-if-changed
flutter analyze --fatal-infos
flutter test --coverage
