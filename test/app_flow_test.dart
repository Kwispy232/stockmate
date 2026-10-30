import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stockmate/app/router.dart';
import 'package:stockmate/features/auth/application/session.dart';
import 'package:stockmate/features/inventory/domain/inventory.dart';

import 'support/test_app.dart';

Future<void> tapVisible(WidgetTester tester, Finder finder) async {
  if (finder.evaluate().isEmpty) {
    await tester.scrollUntilVisible(
      finder,
      250,
      scrollable: find
          .byWidgetPredicate(
            (widget) =>
                widget is Scrollable &&
                (widget.axisDirection == AxisDirection.down ||
                    widget.axisDirection == AxisDirection.up),
          )
          .last,
    );
  }
  await tester.ensureVisible(finder);
  await tester.tap(finder);
  await tester.pumpAndSettle();
}

Future<void> withApp(
  WidgetTester tester,
  Future<void> Function(TestApp) scenario, {
  Workspace? workspace,
  TargetPlatform? platform,
}) async {
  final previousPlatform = debugDefaultTargetPlatformOverride;
  debugDefaultTargetPlatformOverride = platform;
  final app = await TestApp.create(workspace: workspace);
  try {
    await tester.pumpWidget(app.widget);
    await tester.pumpAndSettle();
    await scenario(app);
  } finally {
    await tester.pumpWidget(const SizedBox.shrink());
    app.container.dispose();
    final closing = app.db.close();
    await tester.pump(const Duration(milliseconds: 1));
    await closing;
    debugDefaultTargetPlatformOverride = previousPlatform;
  }
}

void main() {
  for (final platform in [TargetPlatform.iOS, TargetPlatform.android]) {
    testWidgets('$platform: demo → count → validate → review → submit', (tester) async {
      await withApp(tester, (app) async {
        expect(
          platform == TargetPlatform.iOS
              ? find.byType(CupertinoNavigationBar)
              : find.byType(AppBar),
          findsOneWidget,
        );
        await tapVisible(tester, find.byKey(const Key('enterDemo')));
        await tapVisible(tester, find.byKey(const Key('newInventory')));
        await tester.enterText(find.byKey(const Key('inventoryName')), 'Morning count');
        await tapVisible(tester, find.byKey(const Key('createInventory')));
        await tapVisible(tester, find.byKey(const Key('product-A')));
        await tester.enterText(find.byKey(const Key('quantityField')), '-1');
        await tapVisible(tester, find.byKey(const Key('saveCount')));
        expect(find.text('Enter a whole number between 0 and 1,000,000.'), findsOneWidget);
        await tester.enterText(find.byKey(const Key('quantityField')), '0');
        await tapVisible(tester, find.byKey(const Key('saveCount')));
        await tapVisible(tester, find.byKey(const Key('fillRemaining')));
        await tester.tap(find.text('Confirm').last);
        await tester.pumpAndSettle();
        await tapVisible(tester, find.byKey(const Key('reviewInventory')));
        await tapVisible(tester, find.byKey(const Key('submitInventory')));
        await tester.tap(find.text('Submit inventory').last);
        await tester.pumpAndSettle();
        final inventory = app.gateway.submitted.values.single;
        expect(inventory.status, InventoryStatus.submitted);
        expect(inventory.lines.map((line) => line.counted), [0, 0]);
        expect(find.byKey(const Key('submitInventory')), findsNothing);
        expect(tester.takeException(), isNull);
      }, platform: platform);
    });
  }

  testWidgets('Slovak and dark appearance persist; unknown routes are handled', (tester) async {
    await withApp(tester, (app) async {
      app.container.read(routerProvider).go('/inventories/missing');
      await tester.pumpAndSettle();
      expect(find.text('This inventory or product could not be found.'), findsOneWidget);
      app.container.read(routerProvider).go('/settings');
      await tester.pumpAndSettle();
      await tapVisible(tester, find.text('Slovenčina'));
      expect(find.text('Nastavenia'), findsOneWidget);
      expect(app.preferences.getString('locale'), 'sk');
      await tapVisible(tester, find.text('Tmavý'));
      expect(app.preferences.getString('theme'), 'dark');
      expect(Theme.of(tester.element(find.text('Nastavenia'))).brightness, Brightness.dark);
      expect(tester.takeException(), isNull);
    }, workspace: const Workspace.demo());
  });

  testWidgets('welcome and settings fit a narrow display with large text', (tester) async {
    tester.view.physicalSize = const Size(320, 640);
    tester.view.devicePixelRatio = 1;
    tester.platformDispatcher.textScaleFactorTestValue = 2;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    addTearDown(tester.platformDispatcher.clearTextScaleFactorTestValue);
    await withApp(tester, (app) async {
      expect(tester.takeException(), isNull);
      await tapVisible(tester, find.byKey(const Key('enterDemo')));
      expect(tester.takeException(), isNull);
      app.container.read(routerProvider).go('/settings');
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
    });
  });
}
