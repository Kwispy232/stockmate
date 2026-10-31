import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stockmate/app/router.dart';
import 'package:stockmate/features/auth/application/session.dart';
import 'package:stockmate/features/inventory/application/inventory_providers.dart';
import 'package:stockmate/features/inventory/domain/inventory.dart';

import 'support/test_app.dart';

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
    testWidgets('$platform: password visibility preserves text and selection', (tester) async {
      await withApp(tester, (app) async {
        await tapVisible(tester, find.text('Sign in'));
        final field = find.byKey(const Key('passwordField'));
        await tester.enterText(field, 'Test-password-123');
        var editable = tester.widget<EditableText>(
          find.descendant(of: field, matching: find.byType(EditableText)),
        );
        editable.controller.selection = const TextSelection.collapsed(offset: 4);
        final controller = editable.controller;
        expect(editable.obscureText, isTrue);
        expect(editable.autocorrect, isFalse);
        expect(editable.enableSuggestions, isFalse);
        await tapVisible(tester, find.byTooltip('Show password'));
        editable = tester.widget<EditableText>(
          find.descendant(of: field, matching: find.byType(EditableText)),
        );
        expect(editable.obscureText, isFalse);
        expect(controller.text, 'Test-password-123');
        expect(controller.selection.baseOffset, 4);
        expect(editable.autocorrect, isFalse);
        expect(editable.enableSuggestions, isFalse);
        await tapVisible(tester, find.byTooltip('Hide password'));
        expect(
          tester
              .widget<EditableText>(find.descendant(of: field, matching: find.byType(EditableText)))
              .obscureText,
          isTrue,
        );
        expect(controller.text, 'Test-password-123');
        expect(tester.takeException(), isNull);
      }, platform: platform);
    });

    testWidgets('$platform: pull refresh works on empty content and retains data on failure', (
      tester,
    ) async {
      await withApp(
        tester,
        (app) async {
          final remote = Inventory(
            id: 'remote',
            branchId: 'branch',
            branchName: 'Store',
            title: 'Remote count',
            createdAt: DateTime.utc(2026, 10, 30),
            status: InventoryStatus.submitted,
            lines: const [
              CountLine(
                productId: 'a',
                name: 'Coffee',
                sku: 'A',
                barcode: '123',
                expected: 8,
                counted: 8,
              ),
            ],
          );
          app.gateway.submitted[remote.id] = remote;
          final barrier = Completer<void>();
          app.gateway.fetchBarrier = barrier;
          final fetches = app.gateway.fetches;
          try {
            await tester.timedDrag(
              find.byType(CustomScrollView),
              const Offset(0, 400),
              const Duration(seconds: 1),
            );
            for (var i = 0; i < 10 && app.gateway.fetches == fetches; i++) {
              await tester.pump(const Duration(milliseconds: 100));
            }
            expect(app.gateway.fetches, fetches + 1);
            expect(find.text('Synchronizing…'), findsOneWidget);
            expect(find.text('Remote count'), findsNothing);
          } finally {
            barrier.complete();
          }
          await tester.pumpAndSettle();
          expect(find.text('Remote count'), findsOneWidget);
          app.gateway.fetchBarrier = null;

          await tapVisible(tester, find.byKey(const Key('newInventory')));
          await tester.enterText(find.byKey(const Key('inventoryName')), 'Local draft');
          await tapVisible(tester, find.byKey(const Key('createInventory')));
          await tapVisible(tester, find.byKey(const Key('product-A')));
          await tester.enterText(find.byKey(const Key('quantityField')), '4');
          await tapVisible(tester, find.byKey(const Key('saveCount')));
          app.container.read(routerProvider).go('/inventories');
          await tester.pumpAndSettle();
          app.gateway.offline = true;
          tester.state<ScrollableState>(find.byType(Scrollable).first).position.jumpTo(0);
          await tester.pump();
          final previousFetches = app.gateway.fetches;
          await tester.timedDrag(
            find.byType(CustomScrollView),
            const Offset(0, 400),
            const Duration(seconds: 1),
          );
          await tester.pumpAndSettle();
          expect(app.gateway.fetches, previousFetches + 1);
          expect(
            find.text('Connection unavailable. Saved counts are safe on this device.'),
            findsOneWidget,
          );
          final inventories = app.container.read(inventoriesProvider).requireValue;
          expect(inventories.singleWhere((i) => i.title == 'Local draft').lines.first.counted, 4);
          expect(inventories.any((i) => i.id == remote.id), isTrue);
          expect(app.container.read(syncProvider).hasError, isTrue);
          expect(tester.takeException(), isNull);
        },
        workspace: const Workspace.demo(),
        platform: platform,
      );
    });

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

  testWidgets('leaving the demo redirects safely and retains the draft on return', (tester) async {
    await withApp(tester, (app) async {
      await tapVisible(tester, find.byKey(const Key('newInventory')));
      await tester.enterText(find.byKey(const Key('inventoryName')), 'Before sign out');
      await tapVisible(tester, find.byKey(const Key('createInventory')));
      app.container.read(routerProvider).go('/settings');
      await tester.pumpAndSettle();
      await tapVisible(tester, find.byKey(const Key('leaveWorkspace')));
      await tester.tap(find.text('Leave demo').last);
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('enterDemo')), findsOneWidget);
      await tapVisible(tester, find.byKey(const Key('enterDemo')));
      await tapVisible(tester, find.text('Before sign out'));
      expect(tester.takeException(), isNull);
    }, workspace: const Workspace.demo());
  });
}
