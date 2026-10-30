import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/database/app_database.dart';
import '../../auth/application/session.dart';
import '../../settings/application/demo_connection.dart';
import '../data/inventory_gateway.dart';
import '../data/local_inventory_repository.dart';
import '../domain/inventory.dart';
import '../domain/inventory_repository.dart';

final databaseProvider = Provider.autoDispose<AppDatabase>((ref) {
  final workspace = ref.watch(sessionProvider);
  if (workspace == null) throw InventoryIssue.accessDenied;
  final db = AppDatabase(workspace.id);
  ref.onDispose(() => unawaited(db.close()));
  return db;
});

final repositoryProvider = Provider.autoDispose<InventoryRepository>((ref) {
  final workspace = ref.watch(sessionProvider);
  if (workspace == null) throw InventoryIssue.accessDenied;
  return LocalInventoryRepository(
    ref.watch(databaseProvider),
    workspace.isDemo
        ? DemoGateway(isOnline: () => ref.read(demoConnectionProvider))
        : SupabaseInventoryGateway(ref.watch(supabaseProvider), workspace.id),
  );
});

final inventoriesProvider = StreamProvider.autoDispose<List<Inventory>>(
  (ref) => ref.watch(repositoryProvider).watchAll(),
);

final branchesProvider = FutureProvider.autoDispose<List<Branch>>(
  (ref) => ref.watch(repositoryProvider).branches(),
);

final syncProvider = AsyncNotifierProvider.autoDispose<SyncController, void>(SyncController.new);

class SyncController extends AsyncNotifier<void> {
  @override
  Future<void> build() async {
    final repository = ref.watch(repositoryProvider);
    final timer = Timer.periodic(const Duration(seconds: 30), (_) => synchronize());
    ref.onDispose(timer.cancel);
    await repository.synchronize();
  }

  Future<void> synchronize() async {
    if (!ref.mounted || ref.read(sessionProvider) == null || state.isLoading) return;
    state = const AsyncLoading();
    final result = await AsyncValue.guard(ref.read(repositoryProvider).synchronize);
    if (ref.mounted) state = result;
  }
}

final inventoryActionsProvider = AsyncNotifierProvider.autoDispose<InventoryActions, void>(
  InventoryActions.new,
);

class InventoryActions extends AsyncNotifier<void> {
  @override
  void build() => ref.watch(repositoryProvider);

  Future<T> _run<T>(Future<T> Function(InventoryRepository) action) async {
    state = const AsyncLoading();
    try {
      final result = await action(ref.read(repositoryProvider));
      if (ref.mounted) state = const AsyncData(null);
      return result;
    } catch (error, stack) {
      if (ref.mounted) state = AsyncError(error, stack);
      rethrow;
    }
  }

  Future<Inventory> create(Branch branch, String title) =>
      _run((repo) => repo.create(branch, title));
  Future<void> count(String id, String productId, int quantity) =>
      _run((repo) => repo.count(id, productId, quantity));
  Future<void> fillRemaining(String id) => _run((repo) => repo.fillRemaining(id));
  Future<void> delete(String id) => _run((repo) => repo.delete(id));
  Future<void> submit(String id) => _run((repo) => repo.submit(id));
  Future<void> refreshCatalog() => _run((repo) => repo.refreshCatalog());
}
