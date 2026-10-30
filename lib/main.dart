import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'app/backend_config.dart';
import 'app/stockmate_app.dart';
import 'features/settings/application/preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final preferences = await SharedPreferences.getInstance();
  await Supabase.initialize(url: supabaseUrl, publishableKey: supabasePublishableKey, debug: false);
  runApp(
    ProviderScope(
      overrides: [sharedPreferencesProvider.overrideWithValue(preferences)],
      child: const StockMateApp(),
    ),
  );
}
