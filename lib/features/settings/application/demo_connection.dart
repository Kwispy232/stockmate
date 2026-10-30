import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'preferences.dart';

final demoConnectionProvider = NotifierProvider<DemoConnection, bool>(DemoConnection.new);

class DemoConnection extends Notifier<bool> {
  @override
  bool build() => ref.read(sharedPreferencesProvider).getBool('demo_online') ?? true;

  Future<void> setOnline(bool online) async {
    await ref.read(sharedPreferencesProvider).setBool('demo_online', online);
    state = online;
  }
}
