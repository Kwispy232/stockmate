import 'package:drift/native.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stockmate/app/stockmate_app.dart';
import 'package:stockmate/core/database/app_database.dart';
import 'package:stockmate/features/auth/application/session.dart';
import 'package:stockmate/features/inventory/application/inventory_providers.dart';
import 'package:stockmate/features/inventory/data/local_inventory_repository.dart';
import 'package:stockmate/features/settings/application/preferences.dart';

import 'fake_gateway.dart';

class TestSession extends SessionController {
  TestSession(this.initial);
  final Workspace? initial;
  @override
  Workspace? build() => initial;
  @override
  Future<void> enterDemo() async => state = const Workspace.demo();
  @override
  Future<void> leave() async => state = null;
}

class TestApp {
  TestApp._(this.container, this.db, this.gateway, this.repository, this.preferences);
  final ProviderContainer container;
  final AppDatabase db;
  final FakeGateway gateway;
  final LocalInventoryRepository repository;
  final SharedPreferences preferences;

  static Future<TestApp> create({Workspace? workspace}) async {
    SharedPreferences.setMockInitialValues({'locale': 'en'});
    final preferences = await SharedPreferences.getInstance();
    final db = AppDatabase.forTesting(NativeDatabase.memory());
    final gateway = FakeGateway();
    final repository = LocalInventoryRepository(db, gateway);
    final container = ProviderContainer(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(preferences),
        sessionProvider.overrideWith(() => TestSession(workspace)),
        repositoryProvider.overrideWithValue(repository),
      ],
    );
    return TestApp._(container, db, gateway, repository, preferences);
  }

  Widget get widget => UncontrolledProviderScope(container: container, child: const StockMateApp());

  Future<void> dispose() async {
    container.dispose();
    await db.close();
  }
}
