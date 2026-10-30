import 'inventory.dart';

abstract interface class InventoryRepository {
  Stream<List<Inventory>> watchAll();
  Future<List<Branch>> branches();
  Future<Inventory> create(Branch branch, String title);
  Future<void> count(String inventoryId, String productId, int quantity);
  Future<void> fillRemaining(String inventoryId);
  Future<void> delete(String inventoryId);
  Future<void> submit(String inventoryId);
  Future<void> synchronize();
  Future<void> refreshCatalog();
}
