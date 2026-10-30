import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../features/settings/application/preferences.dart';
import '../l10n/app_localizations.dart';
import 'router.dart';

class StockMateApp extends ConsumerWidget {
  const StockMateApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final preferences = ref.watch(preferencesProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: ref.watch(routerProvider),
      onGenerateTitle: (context) => AppLocalizations.of(context).appName,
      locale: preferences.locale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      themeMode: preferences.theme,
      theme: _theme(Brightness.light),
      darkTheme: _theme(Brightness.dark),
      builder: (context, child) => CupertinoTheme(
        data: CupertinoThemeData(
          brightness: Theme.of(context).brightness,
          primaryColor: Theme.of(context).colorScheme.primary,
          scaffoldBackgroundColor: Theme.of(context).colorScheme.surface,
        ),
        child: child!,
      ),
    );
  }
}

ThemeData _theme(Brightness brightness) {
  final dark = brightness == Brightness.dark;
  final colors = ColorScheme.fromSeed(
    seedColor: const Color(0xFF147D73),
    brightness: brightness,
    primary: dark ? const Color(0xFF8DD8C5) : const Color(0xFF147D73),
    surface: dark ? const Color(0xFF111B18) : const Color(0xFFF4F6F3),
  );
  return ThemeData(
    useMaterial3: true,
    colorScheme: colors,
    scaffoldBackgroundColor: colors.surface,
    appBarTheme: AppBarTheme(
      backgroundColor: colors.surface,
      surfaceTintColor: Colors.transparent,
      centerTitle: false,
      titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: colors.onSurface),
    ),
    inputDecorationTheme: const InputDecorationTheme(contentPadding: EdgeInsets.all(15)),
    dividerColor: colors.outlineVariant,
  );
}
