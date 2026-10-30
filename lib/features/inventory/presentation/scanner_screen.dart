import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../../core/ui/adaptive.dart';
import '../application/inventory_providers.dart';
import '../domain/inventory.dart';
import 'inventory_detail_screen.dart';

class ScannerScreen extends ConsumerStatefulWidget {
  const ScannerScreen({super.key, required this.id});
  final String id;
  @override
  ConsumerState<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends ConsumerState<ScannerScreen> with WidgetsBindingObserver {
  final scanner = MobileScannerController(detectionSpeed: DetectionSpeed.noDuplicates);
  final barcode = TextEditingController();
  bool handled = false;
  String? error;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    scanner.dispose();
    barcode.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (!scanner.value.hasCameraPermission || handled) return;
    if (state == AppLifecycleState.resumed) {
      scanner.start();
    } else {
      scanner.stop();
    }
  }

  Future<void> accept(String code, Inventory inventory) async {
    if (handled) return;
    final product = inventory.lines.where((line) => line.barcode == code.trim()).firstOrNull;
    if (product == null) {
      setState(() => error = context.l.unknownBarcode);
      return;
    }
    handled = true;
    try {
      await scanner.stop();
    } catch (_) {}
    if (mounted) context.pop(product.productId);
  }

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(inventoriesProvider);
    final inventory = data.asData?.value.where((item) => item.id == widget.id).firstOrNull;
    if (inventory == null) return InventoryUnavailable(loading: data.isLoading);
    if (inventory.status != InventoryStatus.draft) {
      return AppPage(
        title: context.l.scanBarcode,
        child: Center(child: Text(context.l.locked)),
      );
    }
    return AppPage(
      title: context.l.scanBarcode,
      child: AppScroll(
        maxWidth: 600,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: SizedBox(
              height: 280,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  MobileScanner(
                    controller: scanner,
                    onDetect: (capture) {
                      final code = capture.barcodes
                          .map((barcode) => barcode.rawValue)
                          .whereType<String>()
                          .firstOrNull;
                      if (code != null) accept(code, inventory);
                    },
                    errorBuilder: (context, _) => Container(
                      color: context.colors.surfaceContainerHighest,
                      padding: const EdgeInsets.all(32),
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.no_photography_outlined, size: 40),
                            const SizedBox(height: 16),
                            Text(context.l.cameraUnavailable, style: context.text.titleMedium),
                            const SizedBox(height: 8),
                            Text(context.l.cameraHelp, textAlign: TextAlign.center),
                          ],
                        ),
                      ),
                    ),
                  ),
                  IgnorePointer(
                    child: Container(
                      width: 240,
                      height: 120,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white70, width: 2),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 18),
          Text(context.l.scanHint),
          const SizedBox(height: 28),
          AppField(
            key: const Key('manualBarcode'),
            controller: barcode,
            label: context.l.barcode,
            keyboardType: TextInputType.number,
            maxLength: 32,
            onSubmitted: (value) => accept(value, inventory),
          ),
          if (error != null) ...[
            const SizedBox(height: 12),
            InfoBanner(text: error!, warning: true),
          ],
          const SizedBox(height: 16),
          AppButton(
            key: const Key('findBarcode'),
            label: context.l.findProduct,
            onPressed: () => accept(barcode.text, inventory),
          ),
          const SizedBox(height: 12),
          AppButton(label: context.l.manualLookup, secondary: true, onPressed: () => context.pop()),
        ],
      ),
    );
  }
}
