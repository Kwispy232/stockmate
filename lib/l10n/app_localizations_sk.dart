// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Slovak (`sk`).
class AppLocalizationsSk extends AppLocalizations {
  AppLocalizationsSk([String locale = 'sk']) : super(locale);

  @override
  String get appName => 'StockMate';

  @override
  String get tagline => 'Trochu poriadku. Veľa prehľadu.';

  @override
  String get welcomeTitle => 'Každý kus.\nPod kontrolou.';

  @override
  String get welcomeBody =>
      'Naskenuj, spočítaj a pokračuj. Inventúra zostane v bezpečí aj bez pripojenia.';

  @override
  String get tryDemo => 'Vyskúšať demo';

  @override
  String get signIn => 'Prihlásiť sa';

  @override
  String get createAccount => 'Vytvoriť účet';

  @override
  String get email => 'Email';

  @override
  String get password => 'Heslo';

  @override
  String get showPassword => 'Zobraziť heslo';

  @override
  String get hidePassword => 'Skryť heslo';

  @override
  String get authHint =>
      'Účet sprístupní dve ukážkové predajne. Tvoje odoslané inventúry sú súkromné.';

  @override
  String get checkEmail => 'Potvrď svoj účet cez email a potom sa prihlás.';

  @override
  String get authError =>
      'Prihlásenie sa nepodarilo. Skontroluj email a heslo alebo to skús neskôr.';

  @override
  String get invalidEmail => 'Zadaj platný email a heslo s aspoň 6 znakmi.';

  @override
  String get inventories => 'Inventúry';

  @override
  String get newInventory => 'Nová inventúra';

  @override
  String get createInventory => 'Začať počítať';

  @override
  String get titleLabel => 'Názov inventúry';

  @override
  String get titleHint => 'Napríklad ranná inventúra';

  @override
  String get branch => 'Predajňa';

  @override
  String get cancel => 'Zrušiť';

  @override
  String get save => 'Uložiť počet';

  @override
  String get close => 'Zavrieť';

  @override
  String get back => 'Späť';

  @override
  String get settings => 'Nastavenia';

  @override
  String get searchProducts => 'Hľadať produkt alebo kód';

  @override
  String get allItems => 'Všetky';

  @override
  String get uncounted => 'Nespočítané';

  @override
  String get variances => 'Rozdiely';

  @override
  String get draft => 'Rozpracovaná';

  @override
  String get queued => 'Čaká na odoslanie';

  @override
  String get submitted => 'Dokončená';

  @override
  String get pendingSync => 'Niektoré inventúry čakajú na odoslanie';

  @override
  String get upToDate => 'Všetko je aktuálne';

  @override
  String get syncing => 'Synchronizujem…';

  @override
  String get sync => 'Synchronizovať';

  @override
  String get offlineNotice =>
      'Pripojenie nie je dostupné. Uložené počty sú v bezpečí v tomto zariadení.';

  @override
  String get queuedNotice => 'Uložené do fronty. Odoslanie zopakujeme po pripojení.';

  @override
  String get networkError => 'Pripojenie sa nepodarilo. Uložená práca je v bezpečí, skús to znova.';

  @override
  String get genericError => 'Akcia sa nepodarila. Uložená práca je v bezpečí, skús to znova.';

  @override
  String get invalidQuantity => 'Zadaj celé číslo od 0 do 1 000 000.';

  @override
  String get incomplete => 'Pred odoslaním spočítaj všetky produkty. Pri nenájdených zadaj nulu.';

  @override
  String get locked => 'Inventúra je uzamknutá, pretože už čaká na odoslanie alebo je dokončená.';

  @override
  String get notFound => 'Inventúra alebo produkt sa nenašli.';

  @override
  String get emptyTitle => 'Zadaj názov inventúry s 1 až 80 znakmi.';

  @override
  String get missingCatalog => 'Katalóg zatiaľ nie je dostupný. Pripoj sa a obnov ho.';

  @override
  String get accessDenied => 'Tento účet už nemá prístup k predajni.';

  @override
  String get staleCatalog => 'Katalóg sa zmenil. Zachovaj tento súpis a začni novú inventúru.';

  @override
  String get submissionChanged =>
      'Pod týmto ID už existujú iné údaje. Lokálna kópia zostala zachovaná.';

  @override
  String get expected => 'Evidované';

  @override
  String get counted => 'Spočítané';

  @override
  String get difference => 'Rozdiel';

  @override
  String get quantity => 'Počet kusov';

  @override
  String get barcode => 'Čiarový kód';

  @override
  String get scanBarcode => 'Skenovať kód';

  @override
  String get manualLookup => 'Nájsť ručne';

  @override
  String get cameraUnavailable => 'Kamera nie je dostupná';

  @override
  String get cameraHelp => 'Povoľ kameru v nastaveniach zariadenia alebo zadaj čiarový kód nižšie.';

  @override
  String get scanHint => 'Nasmeruj čiarový kód produktu do rámčeka.';

  @override
  String get unknownBarcode => 'Tento kód nie je v katalógu vybranej predajne.';

  @override
  String get findProduct => 'Nájsť produkt';

  @override
  String get review => 'Skontrolovať inventúru';

  @override
  String get submit => 'Odoslať inventúru';

  @override
  String get retry => 'Skúsiť znova';

  @override
  String get fillRemaining => 'Zvyšné označiť nulou';

  @override
  String get fillTitle => 'Zvyšné produkty chýbajú?';

  @override
  String get fillBody =>
      'Všetky nespočítané produkty dostanú nulu. Existujúce počty zostanú zachované.';

  @override
  String get confirm => 'Potvrdiť';

  @override
  String get submitTitle => 'Odoslať inventúru?';

  @override
  String get submitBody =>
      'Súpis sa uzamkne a zaradí na odoslanie. Neúspešné odoslanie možno bezpečne zopakovať.';

  @override
  String get completedBody =>
      'Inventúra je dokončená a uzamknutá. Pôvodný evidovaný stav zostal zachovaný.';

  @override
  String get queuedBody =>
      'Inventúra je uložená a uzamknutá. Odoslanie môžeš zopakovať teraz alebo neskôr.';

  @override
  String get deleteInventory => 'Vymazať koncept';

  @override
  String get deleteTitle => 'Vymazať tento koncept?';

  @override
  String get deleteBody => 'Koncept aj jeho počty sa odstránia z tohto zariadenia.';

  @override
  String get delete => 'Vymazať';

  @override
  String get noInventories => 'Pripravený na prvé počítanie?';

  @override
  String get noInventoriesBody => 'Vyber predajňu, spočítaj zásoby a zvyšok nechaj na StockMate.';

  @override
  String get noResults => 'Žiadne zodpovedajúce produkty';

  @override
  String get noResultsBody => 'Skús iný názov, čiarový kód alebo filter.';

  @override
  String get overview => 'Zásoby pod kontrolou';

  @override
  String get overviewBody => 'Malé počty. Jasné rozhodnutia.';

  @override
  String get activeCounts => 'Rozpracované';

  @override
  String get completedCounts => 'Dokončené';

  @override
  String get items => 'Produkty';

  @override
  String get localDemo => 'Lokálne demo';

  @override
  String get demoHint => 'Ukážkové údaje zostávajú v zariadení. Účet netreba.';

  @override
  String get demoConnection => 'Pripojenie v deme';

  @override
  String get demoConnectionHint => 'Vypni ho a vyskúšaj frontu odosielania bez siete.';

  @override
  String get online => 'Online';

  @override
  String get offline => 'Offline';

  @override
  String get account => 'Účet';

  @override
  String get appearance => 'Vzhľad';

  @override
  String get language => 'Jazyk';

  @override
  String get system => 'Podľa systému';

  @override
  String get light => 'Svetlý';

  @override
  String get dark => 'Tmavý';

  @override
  String get slovak => 'Slovenčina';

  @override
  String get english => 'English';

  @override
  String get catalogue => 'Katalóg';

  @override
  String get refreshCatalog => 'Obnoviť katalóg';

  @override
  String get catalogRefreshed => 'Katalóg bol obnovený. Existujúce súpisy sa nezmenili.';

  @override
  String get leaveDemo => 'Opustiť demo';

  @override
  String get signOut => 'Odhlásiť sa';

  @override
  String get signOutTitle => 'Opustiť tento priestor?';

  @override
  String get signOutBody =>
      'Uložené koncepty a čakajúce inventúry zostanú v zariadení. Pokračovať môžeš po návrate do rovnakého priestoru.';

  @override
  String get about => 'Flutter portfólio demo · v0.1.0';

  @override
  String get countSaved => 'Počet uložený';

  @override
  String get reviewHint => 'Pred odoslaním skontroluj rozdiely.';

  @override
  String inventoryDefaultTitle(String date) {
    return 'Inventúra · $date';
  }

  @override
  String countProgress(int done, int total) {
    return 'Spočítané $done z $total';
  }

  @override
  String itemsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count produktov',
      few: '$count produkty',
      one: '1 produkt',
      zero: 'Žiadne produkty',
    );
    return '$_temp0';
  }

  @override
  String varianceCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count rozdielov',
      few: '$count rozdiely',
      one: '1 rozdiel',
      zero: 'Bez rozdielov',
    );
    return '$_temp0';
  }
}
