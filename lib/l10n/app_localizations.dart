import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_sk.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('en'), Locale('sk')];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'StockMate'**
  String get appName;

  /// No description provided for @tagline.
  ///
  /// In en, this message translates to:
  /// **'A little order. A lot of clarity.'**
  String get tagline;

  /// No description provided for @welcomeTitle.
  ///
  /// In en, this message translates to:
  /// **'Every shelf.\nAccounted for.'**
  String get welcomeTitle;

  /// No description provided for @welcomeBody.
  ///
  /// In en, this message translates to:
  /// **'Scan, count and carry on. Your inventory stays safe, even when the connection doesn\'t.'**
  String get welcomeBody;

  /// No description provided for @tryDemo.
  ///
  /// In en, this message translates to:
  /// **'Explore the demo'**
  String get tryDemo;

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get signIn;

  /// No description provided for @createAccount.
  ///
  /// In en, this message translates to:
  /// **'Create account'**
  String get createAccount;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @showPassword.
  ///
  /// In en, this message translates to:
  /// **'Show password'**
  String get showPassword;

  /// No description provided for @hidePassword.
  ///
  /// In en, this message translates to:
  /// **'Hide password'**
  String get hidePassword;

  /// No description provided for @authHint.
  ///
  /// In en, this message translates to:
  /// **'Your account opens two sample stores. Your inventory submissions are private.'**
  String get authHint;

  /// No description provided for @checkEmail.
  ///
  /// In en, this message translates to:
  /// **'Check your email to confirm your account, then sign in.'**
  String get checkEmail;

  /// No description provided for @authError.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t sign in. Check your email and password, or try again later.'**
  String get authError;

  /// No description provided for @invalidEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid email and a password of at least 6 characters.'**
  String get invalidEmail;

  /// No description provided for @inventories.
  ///
  /// In en, this message translates to:
  /// **'Inventories'**
  String get inventories;

  /// No description provided for @newInventory.
  ///
  /// In en, this message translates to:
  /// **'New inventory'**
  String get newInventory;

  /// No description provided for @createInventory.
  ///
  /// In en, this message translates to:
  /// **'Start counting'**
  String get createInventory;

  /// No description provided for @titleLabel.
  ///
  /// In en, this message translates to:
  /// **'Inventory name'**
  String get titleLabel;

  /// No description provided for @titleHint.
  ///
  /// In en, this message translates to:
  /// **'For example, morning stock count'**
  String get titleHint;

  /// No description provided for @branch.
  ///
  /// In en, this message translates to:
  /// **'Store'**
  String get branch;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save count'**
  String get save;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @searchProducts.
  ///
  /// In en, this message translates to:
  /// **'Search product or barcode'**
  String get searchProducts;

  /// No description provided for @allItems.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get allItems;

  /// No description provided for @uncounted.
  ///
  /// In en, this message translates to:
  /// **'To count'**
  String get uncounted;

  /// No description provided for @variances.
  ///
  /// In en, this message translates to:
  /// **'Differences'**
  String get variances;

  /// No description provided for @draft.
  ///
  /// In en, this message translates to:
  /// **'In progress'**
  String get draft;

  /// No description provided for @queued.
  ///
  /// In en, this message translates to:
  /// **'Waiting to send'**
  String get queued;

  /// No description provided for @submitted.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get submitted;

  /// No description provided for @pendingSync.
  ///
  /// In en, this message translates to:
  /// **'Some counts are waiting to send'**
  String get pendingSync;

  /// No description provided for @upToDate.
  ///
  /// In en, this message translates to:
  /// **'Everything is up to date'**
  String get upToDate;

  /// No description provided for @syncing.
  ///
  /// In en, this message translates to:
  /// **'Synchronizing…'**
  String get syncing;

  /// No description provided for @sync.
  ///
  /// In en, this message translates to:
  /// **'Synchronize'**
  String get sync;

  /// No description provided for @offlineNotice.
  ///
  /// In en, this message translates to:
  /// **'Connection unavailable. Saved counts are safe on this device.'**
  String get offlineNotice;

  /// No description provided for @queuedNotice.
  ///
  /// In en, this message translates to:
  /// **'Saved to the sending queue. We\'ll retry when you\'re connected.'**
  String get queuedNotice;

  /// No description provided for @networkError.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t connect. Your saved work is safe; please try again.'**
  String get networkError;

  /// No description provided for @genericError.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t complete that action. Your saved work is safe; please try again.'**
  String get genericError;

  /// No description provided for @invalidQuantity.
  ///
  /// In en, this message translates to:
  /// **'Enter a whole number between 0 and 1,000,000.'**
  String get invalidQuantity;

  /// No description provided for @incomplete.
  ///
  /// In en, this message translates to:
  /// **'Count every product before submitting. Use zero for products you didn\'t find.'**
  String get incomplete;

  /// No description provided for @locked.
  ///
  /// In en, this message translates to:
  /// **'This inventory is locked because it has already been queued or completed.'**
  String get locked;

  /// No description provided for @notFound.
  ///
  /// In en, this message translates to:
  /// **'This inventory or product could not be found.'**
  String get notFound;

  /// No description provided for @emptyTitle.
  ///
  /// In en, this message translates to:
  /// **'Enter an inventory name of 1–80 characters.'**
  String get emptyTitle;

  /// No description provided for @missingCatalog.
  ///
  /// In en, this message translates to:
  /// **'No catalogue is available yet. Connect and refresh the catalogue.'**
  String get missingCatalog;

  /// No description provided for @accessDenied.
  ///
  /// In en, this message translates to:
  /// **'This account no longer has access to this store.'**
  String get accessDenied;

  /// No description provided for @staleCatalog.
  ///
  /// In en, this message translates to:
  /// **'The catalogue has changed. Keep this count for reference and start a new inventory.'**
  String get staleCatalog;

  /// No description provided for @submissionChanged.
  ///
  /// In en, this message translates to:
  /// **'This submission ID already has different data. Your local copy has been retained.'**
  String get submissionChanged;

  /// No description provided for @expected.
  ///
  /// In en, this message translates to:
  /// **'Expected'**
  String get expected;

  /// No description provided for @counted.
  ///
  /// In en, this message translates to:
  /// **'Counted'**
  String get counted;

  /// No description provided for @difference.
  ///
  /// In en, this message translates to:
  /// **'Difference'**
  String get difference;

  /// No description provided for @quantity.
  ///
  /// In en, this message translates to:
  /// **'Quantity'**
  String get quantity;

  /// No description provided for @barcode.
  ///
  /// In en, this message translates to:
  /// **'Barcode'**
  String get barcode;

  /// No description provided for @scanBarcode.
  ///
  /// In en, this message translates to:
  /// **'Scan barcode'**
  String get scanBarcode;

  /// No description provided for @manualLookup.
  ///
  /// In en, this message translates to:
  /// **'Find manually'**
  String get manualLookup;

  /// No description provided for @cameraUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Camera unavailable'**
  String get cameraUnavailable;

  /// No description provided for @cameraHelp.
  ///
  /// In en, this message translates to:
  /// **'Allow camera access in your device settings, or enter a barcode below.'**
  String get cameraHelp;

  /// No description provided for @scanHint.
  ///
  /// In en, this message translates to:
  /// **'Place a product barcode inside the frame.'**
  String get scanHint;

  /// No description provided for @unknownBarcode.
  ///
  /// In en, this message translates to:
  /// **'This barcode isn\'t in the selected store\'s catalogue.'**
  String get unknownBarcode;

  /// No description provided for @findProduct.
  ///
  /// In en, this message translates to:
  /// **'Find product'**
  String get findProduct;

  /// No description provided for @review.
  ///
  /// In en, this message translates to:
  /// **'Review inventory'**
  String get review;

  /// No description provided for @submit.
  ///
  /// In en, this message translates to:
  /// **'Submit inventory'**
  String get submit;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get retry;

  /// No description provided for @fillRemaining.
  ///
  /// In en, this message translates to:
  /// **'Mark remaining as zero'**
  String get fillRemaining;

  /// No description provided for @fillTitle.
  ///
  /// In en, this message translates to:
  /// **'No remaining stock?'**
  String get fillTitle;

  /// No description provided for @fillBody.
  ///
  /// In en, this message translates to:
  /// **'Every uncounted product will be recorded as zero. Existing counts will stay as they are.'**
  String get fillBody;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @submitTitle.
  ///
  /// In en, this message translates to:
  /// **'Submit this inventory?'**
  String get submitTitle;

  /// No description provided for @submitBody.
  ///
  /// In en, this message translates to:
  /// **'The count will be locked and queued for sending. You can safely retry a failed submission.'**
  String get submitBody;

  /// No description provided for @completedBody.
  ///
  /// In en, this message translates to:
  /// **'This count is complete and locked. The original stock snapshot is preserved.'**
  String get completedBody;

  /// No description provided for @queuedBody.
  ///
  /// In en, this message translates to:
  /// **'This count is saved and locked. Keep the app open to retry, or return later.'**
  String get queuedBody;

  /// No description provided for @deleteInventory.
  ///
  /// In en, this message translates to:
  /// **'Delete draft'**
  String get deleteInventory;

  /// No description provided for @deleteTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete this draft?'**
  String get deleteTitle;

  /// No description provided for @deleteBody.
  ///
  /// In en, this message translates to:
  /// **'This removes the draft and its counts from this device.'**
  String get deleteBody;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @noInventories.
  ///
  /// In en, this message translates to:
  /// **'Ready for your first count?'**
  String get noInventories;

  /// No description provided for @noInventoriesBody.
  ///
  /// In en, this message translates to:
  /// **'Choose a store, count what\'s there, and leave the paperwork to StockMate.'**
  String get noInventoriesBody;

  /// No description provided for @noResults.
  ///
  /// In en, this message translates to:
  /// **'No matching products'**
  String get noResults;

  /// No description provided for @noResultsBody.
  ///
  /// In en, this message translates to:
  /// **'Try another name or barcode, or change the filter.'**
  String get noResultsBody;

  /// No description provided for @overview.
  ///
  /// In en, this message translates to:
  /// **'Your stock, in order'**
  String get overview;

  /// No description provided for @overviewBody.
  ///
  /// In en, this message translates to:
  /// **'Small counts. Clear decisions.'**
  String get overviewBody;

  /// No description provided for @activeCounts.
  ///
  /// In en, this message translates to:
  /// **'In progress'**
  String get activeCounts;

  /// No description provided for @completedCounts.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get completedCounts;

  /// No description provided for @items.
  ///
  /// In en, this message translates to:
  /// **'Products'**
  String get items;

  /// No description provided for @localDemo.
  ///
  /// In en, this message translates to:
  /// **'Local demo'**
  String get localDemo;

  /// No description provided for @demoHint.
  ///
  /// In en, this message translates to:
  /// **'Sample data stays on this device. No account needed.'**
  String get demoHint;

  /// No description provided for @demoConnection.
  ///
  /// In en, this message translates to:
  /// **'Demo connection'**
  String get demoConnection;

  /// No description provided for @demoConnectionHint.
  ///
  /// In en, this message translates to:
  /// **'Turn off to try the offline sending queue.'**
  String get demoConnectionHint;

  /// No description provided for @online.
  ///
  /// In en, this message translates to:
  /// **'Online'**
  String get online;

  /// No description provided for @offline.
  ///
  /// In en, this message translates to:
  /// **'Offline'**
  String get offline;

  /// No description provided for @account.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get account;

  /// No description provided for @appearance.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get appearance;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @system.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get system;

  /// No description provided for @light.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get light;

  /// No description provided for @dark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get dark;

  /// No description provided for @slovak.
  ///
  /// In en, this message translates to:
  /// **'Slovenčina'**
  String get slovak;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @catalogue.
  ///
  /// In en, this message translates to:
  /// **'Catalogue'**
  String get catalogue;

  /// No description provided for @refreshCatalog.
  ///
  /// In en, this message translates to:
  /// **'Refresh catalogue'**
  String get refreshCatalog;

  /// No description provided for @catalogRefreshed.
  ///
  /// In en, this message translates to:
  /// **'Catalogue updated. Existing inventory snapshots are unchanged.'**
  String get catalogRefreshed;

  /// No description provided for @leaveDemo.
  ///
  /// In en, this message translates to:
  /// **'Leave demo'**
  String get leaveDemo;

  /// No description provided for @signOut.
  ///
  /// In en, this message translates to:
  /// **'Sign out'**
  String get signOut;

  /// No description provided for @signOutTitle.
  ///
  /// In en, this message translates to:
  /// **'Leave this workspace?'**
  String get signOutTitle;

  /// No description provided for @signOutBody.
  ///
  /// In en, this message translates to:
  /// **'Saved drafts and queued counts stay on this device. Return to the same workspace to continue.'**
  String get signOutBody;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'Flutter portfolio demo · v0.1.0'**
  String get about;

  /// No description provided for @countSaved.
  ///
  /// In en, this message translates to:
  /// **'Count saved'**
  String get countSaved;

  /// No description provided for @reviewHint.
  ///
  /// In en, this message translates to:
  /// **'Check the differences before submitting.'**
  String get reviewHint;

  /// No description provided for @inventoryDefaultTitle.
  ///
  /// In en, this message translates to:
  /// **'Stock count · {date}'**
  String inventoryDefaultTitle(String date);

  /// No description provided for @countProgress.
  ///
  /// In en, this message translates to:
  /// **'{done} of {total} counted'**
  String countProgress(int done, int total);

  /// No description provided for @itemsCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{No products} one{1 product} other{{count} products}}'**
  String itemsCount(int count);

  /// No description provided for @varianceCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{No differences} one{1 difference} other{{count} differences}}'**
  String varianceCount(int count);
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'sk'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'sk':
      return AppLocalizationsSk();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
