import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stockmate/app/router.dart';
import 'package:stockmate/app/stockmate_app.dart';
import 'package:stockmate/features/inventory/application/inventory_providers.dart';
import 'package:stockmate/features/inventory/domain/inventory.dart';
import 'package:stockmate/main.dart' as app;

Future<void> tapVisible(WidgetTester tester, Finder finder) async {
  if (finder.evaluate().isEmpty) {
    final scrollable = find
        .byWidgetPredicate(
          (widget) => widget is Scrollable && widget.axisDirection == AxisDirection.down,
        )
        .last;
    tester.state<ScrollableState>(scrollable).position.jumpTo(0);
    await tester.pumpAndSettle();
  }
  if (finder.evaluate().isEmpty) {
    await tester.scrollUntilVisible(
      finder,
      220,
      scrollable: find
          .byWidgetPredicate(
            (widget) => widget is Scrollable && widget.axisDirection == AxisDirection.down,
          )
          .last,
    );
  }
  await tester.ensureVisible(finder);
  await tester.tap(finder);
  await tester.pumpAndSettle();
}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('native demo queues offline and retries after reconnecting', (tester) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString('locale', 'en');
    await preferences.setBool('demo', true);
    await preferences.setBool('demo_online', false);
    await app.main();
    await tester.pumpAndSettle();
    final name = 'Simulator count ${DateTime.now().millisecondsSinceEpoch}';
    await tapVisible(tester, find.byKey(const Key('newInventory')));
    await tester.enterText(find.byKey(const Key('inventoryName')), name);
    await tapVisible(tester, find.byKey(const Key('createInventory')));
    await tapVisible(tester, find.byKey(const Key('product-SM-001')));
    await tester.enterText(find.byKey(const Key('quantityField')), '4');
    await tapVisible(tester, find.byKey(const Key('saveCount')));
    await tapVisible(tester, find.byKey(const Key('fillRemaining')));
    await tester.tap(find.text('Confirm').last);
    await tester.pumpAndSettle();
    await tapVisible(tester, find.byKey(const Key('reviewInventory')));
    await tapVisible(tester, find.byKey(const Key('submitInventory')));
    await tester.tap(find.text('Submit inventory').last);
    await tester.pumpAndSettle();
    await tester.tap(find.text('Close').last);
    await tester.pumpAndSettle();
    final container = ProviderScope.containerOf(tester.element(find.byType(StockMateApp)));
    final queued = await container.read(repositoryProvider).watchAll().first;
    expect(
      queued.singleWhere((inventory) => inventory.title == name).status,
      InventoryStatus.queued,
    );
    container.read(routerProvider).go('/settings');
    await tester.pumpAndSettle();
    await tapVisible(tester, find.byKey(const Key('demoConnection')));
    container.read(routerProvider).go('/inventories');
    await tester.pumpAndSettle();
    final inventories = await container.read(inventoriesProvider.future);
    final inventory = inventories.singleWhere((inventory) => inventory.title == name);
    expect(inventory.status, InventoryStatus.submitted);
    expect(inventory.lines.singleWhere((line) => line.sku == 'SM-001').counted, 4);
    expect(tester.takeException(), isNull);
  });
}
