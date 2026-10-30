import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) => throw UnimplementedError());

class AppPreferences {
  const AppPreferences({this.locale, this.theme = ThemeMode.system});
  final Locale? locale;
  final ThemeMode theme;
}

final preferencesProvider = NotifierProvider<PreferencesController, AppPreferences>(
  PreferencesController.new,
);

class PreferencesController extends Notifier<AppPreferences> {
  SharedPreferences get _store => ref.read(sharedPreferencesProvider);

  @override
  AppPreferences build() {
    final locale = _store.getString('locale');
    final theme = _store.getString('theme');
    return AppPreferences(
      locale: locale == null ? null : Locale(locale),
      theme: ThemeMode.values.firstWhere(
        (mode) => mode.name == theme,
        orElse: () => ThemeMode.system,
      ),
    );
  }

  Future<void> setLocale(String? language) async {
    if (language == null) {
      await _store.remove('locale');
    } else {
      await _store.setString('locale', language);
    }
    state = AppPreferences(locale: language == null ? null : Locale(language), theme: state.theme);
  }

  Future<void> setTheme(ThemeMode theme) async {
    await _store.setString('theme', theme.name);
    state = AppPreferences(locale: state.locale, theme: theme);
  }
}
