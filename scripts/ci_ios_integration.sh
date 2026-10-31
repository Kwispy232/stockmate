#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
simulator_id="${1:?Pass the CI simulator identifier}"
mkdir -p build/ios-integration

xcrun simctl spawn "$simulator_id" log stream --style compact --level info \
  --predicate 'process == "Runner" OR process == "SpringBoard"' \
  > build/ios-integration/device.log 2>&1 &
log_pid=$!

collect_diagnostics() {
  kill "$log_pid" 2>/dev/null || true
  xcrun simctl io "$simulator_id" screenshot build/ios-integration/final-screen.png >/dev/null 2>&1 || true
  if [ -d "$HOME/Library/Logs/DiagnosticReports" ]; then
    mkdir -p build/ios-integration/crashes
    find "$HOME/Library/Logs/DiagnosticReports" -maxdepth 1 -name 'Runner*' \
      -exec cp {} build/ios-integration/crashes/ \;
  fi
}
trap collect_diagnostics EXIT

flutter test integration_test/demo_flow_test.dart --no-pub --reporter expanded \
  --file-reporter json:build/ios-integration/tests.json --verbose -d "$simulator_id" \
  2>&1 | tee build/ios-integration/flutter.log
