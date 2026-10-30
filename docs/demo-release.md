StockMate portfolio demo. Start with **Explore the demo**; no account is required.

- **Android:** download and install `StockMate-android.apk` on an ARM64 device. This demo uses development signing; uninstall an older demo if its signing key differs.
- **iOS:** unzip `StockMate-ios-simulator.zip`, then run `xcrun simctl install booted Runner.app` and `xcrun simctl launch booted dev.sebastianmraz.stockmate` on a Mac with Xcode and a booted iOS simulator. The debug simulator build is not an iPhone IPA.
- The platform manifests record the source commit, Flutter revision, build number, and artifact SHA-256.

Try: create an inventory, count a product, mark the remaining products as zero, turn off **Demo connection** in Settings, submit, then reconnect and synchronize. Drafts and queued counts survive restarting the app.

An email account enables the separate Supabase workspace. Confirm the email if requested, then sign in. Demo data stays separate from account data.
