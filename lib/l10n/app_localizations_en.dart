// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'StockMate';

  @override
  String get tagline => 'A little order. A lot of clarity.';

  @override
  String get welcomeTitle => 'Every shelf.\nAccounted for.';

  @override
  String get welcomeBody =>
      'Scan, count and carry on. Your inventory stays safe, even when the connection doesn\'t.';

  @override
  String get tryDemo => 'Explore the demo';

  @override
  String get signIn => 'Sign in';

  @override
  String get createAccount => 'Create account';

  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

  @override
  String get authHint =>
      'Your account opens two sample stores. Your inventory submissions are private.';

  @override
  String get checkEmail => 'Check your email to confirm your account, then sign in.';

  @override
  String get authError => 'Couldn\'t sign in. Check your email and password, or try again later.';

  @override
  String get invalidEmail => 'Enter a valid email and a password of at least 6 characters.';

  @override
  String get inventories => 'Inventories';

  @override
  String get newInventory => 'New inventory';

  @override
  String get createInventory => 'Start counting';

  @override
  String get titleLabel => 'Inventory name';

  @override
  String get titleHint => 'For example, morning stock count';

  @override
  String get branch => 'Store';

  @override
  String get cancel => 'Cancel';

  @override
  String get save => 'Save count';

  @override
  String get close => 'Close';

  @override
  String get back => 'Back';

  @override
  String get settings => 'Settings';

  @override
  String get searchProducts => 'Search product or barcode';

  @override
  String get allItems => 'All';

  @override
  String get uncounted => 'To count';

  @override
  String get variances => 'Differences';

  @override
  String get draft => 'In progress';

  @override
  String get queued => 'Waiting to send';

  @override
  String get submitted => 'Completed';

  @override
  String get pendingSync => 'Some counts are waiting to send';

  @override
  String get upToDate => 'Everything is up to date';

  @override
  String get syncing => 'Synchronizing…';

  @override
  String get sync => 'Synchronize';

  @override
  String get offlineNotice => 'Connection unavailable. Saved counts are safe on this device.';

  @override
  String get queuedNotice => 'Saved to the sending queue. We\'ll retry when you\'re connected.';

  @override
  String get networkError => 'Couldn\'t connect. Your saved work is safe; please try again.';

  @override
  String get genericError =>
      'Couldn\'t complete that action. Your saved work is safe; please try again.';

  @override
  String get invalidQuantity => 'Enter a whole number between 0 and 1,000,000.';

  @override
  String get incomplete =>
      'Count every product before submitting. Use zero for products you didn\'t find.';

  @override
  String get locked => 'This inventory is locked because it has already been queued or completed.';

  @override
  String get notFound => 'This inventory or product could not be found.';

  @override
  String get emptyTitle => 'Enter an inventory name of 1–80 characters.';

  @override
  String get missingCatalog => 'No catalogue is available yet. Connect and refresh the catalogue.';

  @override
  String get accessDenied => 'This account no longer has access to this store.';

  @override
  String get staleCatalog =>
      'The catalogue has changed. Keep this count for reference and start a new inventory.';

  @override
  String get submissionChanged =>
      'This submission ID already has different data. Your local copy has been retained.';

  @override
  String get expected => 'Expected';

  @override
  String get counted => 'Counted';

  @override
  String get difference => 'Difference';

  @override
  String get quantity => 'Quantity';

  @override
  String get barcode => 'Barcode';

  @override
  String get scanBarcode => 'Scan barcode';

  @override
  String get manualLookup => 'Find manually';

  @override
  String get cameraUnavailable => 'Camera unavailable';

  @override
  String get cameraHelp => 'Allow camera access in your device settings, or enter a barcode below.';

  @override
  String get scanHint => 'Place a product barcode inside the frame.';

  @override
  String get unknownBarcode => 'This barcode isn\'t in the selected store\'s catalogue.';

  @override
  String get findProduct => 'Find product';

  @override
  String get review => 'Review inventory';

  @override
  String get submit => 'Submit inventory';

  @override
  String get retry => 'Try again';

  @override
  String get fillRemaining => 'Mark remaining as zero';

  @override
  String get fillTitle => 'No remaining stock?';

  @override
  String get fillBody =>
      'Every uncounted product will be recorded as zero. Existing counts will stay as they are.';

  @override
  String get confirm => 'Confirm';

  @override
  String get submitTitle => 'Submit this inventory?';

  @override
  String get submitBody =>
      'The count will be locked and queued for sending. You can safely retry a failed submission.';

  @override
  String get completedBody =>
      'This count is complete and locked. The original stock snapshot is preserved.';

  @override
  String get queuedBody =>
      'This count is saved and locked. Keep the app open to retry, or return later.';

  @override
  String get deleteInventory => 'Delete draft';

  @override
  String get deleteTitle => 'Delete this draft?';

  @override
  String get deleteBody => 'This removes the draft and its counts from this device.';

  @override
  String get delete => 'Delete';

  @override
  String get noInventories => 'Ready for your first count?';

  @override
  String get noInventoriesBody =>
      'Choose a store, count what\'s there, and leave the paperwork to StockMate.';

  @override
  String get noResults => 'No matching products';

  @override
  String get noResultsBody => 'Try another name or barcode, or change the filter.';

  @override
  String get overview => 'Your stock, in order';

  @override
  String get overviewBody => 'Small counts. Clear decisions.';

  @override
  String get activeCounts => 'In progress';

  @override
  String get completedCounts => 'Completed';

  @override
  String get items => 'Products';

  @override
  String get localDemo => 'Local demo';

  @override
  String get demoHint => 'Sample data stays on this device. No account needed.';

  @override
  String get demoConnection => 'Demo connection';

  @override
  String get demoConnectionHint => 'Turn off to try the offline sending queue.';

  @override
  String get online => 'Online';

  @override
  String get offline => 'Offline';

  @override
  String get account => 'Account';

  @override
  String get appearance => 'Appearance';

  @override
  String get language => 'Language';

  @override
  String get system => 'System';

  @override
  String get light => 'Light';

  @override
  String get dark => 'Dark';

  @override
  String get slovak => 'Slovenčina';

  @override
  String get english => 'English';

  @override
  String get catalogue => 'Catalogue';

  @override
  String get refreshCatalog => 'Refresh catalogue';

  @override
  String get catalogRefreshed => 'Catalogue updated. Existing inventory snapshots are unchanged.';

  @override
  String get leaveDemo => 'Leave demo';

  @override
  String get signOut => 'Sign out';

  @override
  String get signOutTitle => 'Leave this workspace?';

  @override
  String get signOutBody =>
      'Saved drafts and queued counts stay on this device. Return to the same workspace to continue.';

  @override
  String get about => 'Flutter portfolio demo · v0.1.0';

  @override
  String get countSaved => 'Count saved';

  @override
  String get reviewHint => 'Check the differences before submitting.';

  @override
  String inventoryDefaultTitle(String date) {
    return 'Stock count · $date';
  }

  @override
  String countProgress(int done, int total) {
    return '$done of $total counted';
  }

  @override
  String itemsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count products',
      one: '1 product',
      zero: 'No products',
    );
    return '$_temp0';
  }

  @override
  String varianceCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count differences',
      one: '1 difference',
      zero: 'No differences',
    );
    return '$_temp0';
  }
}
