import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/ui/adaptive.dart';
import '../application/inventory_providers.dart';
import '../domain/inventory.dart';

class InventoryDetailScreen extends ConsumerStatefulWidget {
  const InventoryDetailScreen({super.key, required this.id});
  final String id;
  @override
  ConsumerState<InventoryDetailScreen> createState() => _InventoryDetailScreenState();
}

class _InventoryDetailScreenState extends ConsumerState<InventoryDetailScreen> {
  final search = TextEditingController();
  int filter = 0;
  @override
  void dispose() {
    search.dispose();
    super.dispose();
  }

  Future<void> edit(Inventory inventory, CountLine line) async {
    if (inventory.status != InventoryStatus.draft) return;
    final editor = CountEditor(inventoryId: inventory.id, line: line);
    if (context.isIOS) {
      await showCupertinoModalPopup<void>(context: context, builder: (_) => editor);
    } else {
      await showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        useSafeArea: true,
        builder: (_) => editor,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final inventories = ref.watch(inventoriesProvider);
    final inventory = inventories.asData?.value.where((item) => item.id == widget.id).firstOrNull;
    if (inventory == null) return InventoryUnavailable(loading: inventories.isLoading);
    final editable = inventory.status == InventoryStatus.draft;
    final busy = ref.watch(inventoryActionsProvider).isLoading;
    final query = search.text.trim().toLowerCase();
    final lines = inventory.lines
        .where(
          (line) =>
              (query.isEmpty ||
                  '${line.name} ${line.sku} ${line.barcode}'.toLowerCase().contains(query)) &&
              (filter == 0 || (filter == 1 ? line.counted == null : (line.difference ?? 0) != 0)),
        )
        .toList();
    final summary = [
      InventorySummary(inventory),
      const SizedBox(height: 16),
      if (editable) ...[
        AppButton(
          key: const Key('openScanner'),
          label: context.l.scanBarcode,
          icon: Icons.qr_code_scanner_rounded,
          onPressed: busy
              ? null
              : () async {
                  final productId = await context.push<String>('/inventories/${inventory.id}/scan');
                  if (productId != null && mounted) {
                    await edit(
                      inventory,
                      inventory.lines.firstWhere((line) => line.productId == productId),
                    );
                  }
                },
        ),
        const SizedBox(height: 10),
      ],
      AppButton(
        key: const Key('reviewInventory'),
        label: context.l.review,
        secondary: true,
        onPressed: () => context.push('/inventories/${inventory.id}/review'),
      ),
      if (editable && !inventory.isComplete) ...[
        const SizedBox(height: 10),
        AppButton(
          key: const Key('fillRemaining'),
          label: context.l.fillRemaining,
          secondary: true,
          onPressed: busy
              ? null
              : () => guardAction(context, () async {
                  if (await confirmAction(
                    context,
                    title: context.l.fillTitle,
                    body: context.l.fillBody,
                    confirm: context.l.confirm,
                  )) {
                    await ref.read(inventoryActionsProvider.notifier).fillRemaining(inventory.id);
                  }
                }),
        ),
      ],
      const SizedBox(height: 24),
    ];
    final content = [
      AppField(
        key: const Key('productSearch'),
        controller: search,
        label: context.l.searchProducts,
        onChanged: (_) => setState(() {}),
      ),
      const SizedBox(height: 16),
      Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          for (final (index, label) in [
            context.l.allItems,
            context.l.uncounted,
            context.l.variances,
          ].indexed)
            if (context.isIOS)
              CupertinoButton(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                color: filter == index
                    ? context.colors.primary
                    : context.colors.surfaceContainerHighest,
                foregroundColor: filter == index ? Colors.white : context.colors.onSurface,
                borderRadius: BorderRadius.circular(10),
                onPressed: () => setState(() => filter = index),
                child: Text(label),
              )
            else
              ChoiceChip(
                label: Text(label),
                selected: filter == index,
                onSelected: (_) => setState(() => filter = index),
              ),
        ],
      ),
      const SizedBox(height: 20),
      if (lines.isEmpty) EmptyState(title: context.l.noResults, body: context.l.noResultsBody),
      for (final line in lines) ...[
        CountLineTile(line: line, onTap: editable && !busy ? () => edit(inventory, line) : null),
        const SizedBox(height: 8),
      ],
    ];
    return AppPage(
      title: inventory.title,
      trailing: editable
          ? AppIconButton(
              label: context.l.deleteInventory,
              icon: Icons.delete_outline_rounded,
              onPressed: busy
                  ? null
                  : () => guardAction(context, () async {
                      if (!await confirmAction(
                        context,
                        title: context.l.deleteTitle,
                        body: context.l.deleteBody,
                        confirm: context.l.delete,
                        destructive: true,
                      )) {
                        return;
                      }
                      await ref.read(inventoryActionsProvider.notifier).delete(inventory.id);
                      if (context.mounted) context.go('/inventories');
                    }),
            )
          : null,
      child: LayoutBuilder(
        builder: (context, constraints) => constraints.maxWidth >= 850
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: AppScroll(children: content)),
                  SizedBox(width: 340, child: AppScroll(children: summary)),
                ],
              )
            : AppScroll(children: [...summary, ...content]),
      ),
    );
  }
}

class InventoryUnavailable extends StatelessWidget {
  const InventoryUnavailable({super.key, this.loading = false});
  final bool loading;
  @override
  Widget build(BuildContext context) => AppPage(
    title: context.l.inventories,
    child: Center(
      child: loading ? const CircularProgressIndicator.adaptive() : Text(context.l.notFound),
    ),
  );
}

class InventorySummary extends StatelessWidget {
  const InventorySummary(this.inventory, {super.key});
  final Inventory inventory;
  @override
  Widget build(BuildContext context) => Panel(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StatusBadge(inventory.status),
        const SizedBox(height: 16),
        Text(inventory.branchName, style: context.text.titleMedium),
        const SizedBox(height: 20),
        Text(
          '${inventory.countedLines} / ${inventory.lines.length}',
          style: context.text.headlineMedium?.copyWith(fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 6),
        Text(context.l.countProgress(inventory.countedLines, inventory.lines.length)),
        const SizedBox(height: 16),
        LinearProgressIndicator(
          value: inventory.lines.isEmpty ? 0 : inventory.countedLines / inventory.lines.length,
          minHeight: 6,
          borderRadius: BorderRadius.circular(10),
        ),
        const SizedBox(height: 16),
        Text(context.l.varianceCount(inventory.varianceLines)),
      ],
    ),
  );
}

class CountLineTile extends StatelessWidget {
  const CountLineTile({super.key, required this.line, this.onTap});
  final CountLine line;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) => Semantics(
    button: onTap != null,
    child: InkWell(
      key: Key('product-${line.sku}'),
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Panel(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: line.counted == null
                    ? context.colors.surfaceContainerHighest
                    : context.colors.primaryContainer,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                line.counted == null ? Icons.inventory_2_outlined : Icons.check_rounded,
                color: context.colors.primary,
                size: 22,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(line.name, style: context.text.titleSmall),
                  const SizedBox(height: 5),
                  Text(
                    '${line.sku} · ${context.l.expected}: ${line.expected}',
                    style: context.text.bodySmall,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Text(
              line.counted?.toString() ?? '—',
              style: context.text.titleLarge?.copyWith(fontWeight: FontWeight.w600),
            ),
            if (onTap != null) ...[
              const SizedBox(width: 8),
              const Icon(Icons.chevron_right_rounded, size: 20),
            ],
          ],
        ),
      ),
    ),
  );
}

class CountEditor extends ConsumerStatefulWidget {
  const CountEditor({super.key, required this.inventoryId, required this.line});
  final String inventoryId;
  final CountLine line;
  @override
  ConsumerState<CountEditor> createState() => _CountEditorState();
}

class _CountEditorState extends ConsumerState<CountEditor> {
  late final quantity = TextEditingController(text: widget.line.counted?.toString() ?? '');
  String? error;
  @override
  void dispose() {
    quantity.dispose();
    super.dispose();
  }

  Future<void> save() async {
    final count = int.tryParse(quantity.text.trim());
    if (count == null || count < 0 || count > 1000000) {
      setState(() => error = context.l.invalidQuantity);
      return;
    }
    try {
      await ref
          .read(inventoryActionsProvider.notifier)
          .count(widget.inventoryId, widget.line.productId, count);
      if (mounted) Navigator.pop(context);
    } catch (issue) {
      if (mounted) setState(() => error = errorMessage(context, issue));
    }
  }

  @override
  Widget build(BuildContext context) {
    final busy = ref.watch(inventoryActionsProvider).isLoading;
    return Material(
      color: context.colors.surface,
      borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      clipBehavior: Clip.antiAlias,
      child: SafeArea(
        top: false,
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(24, 24, 24, MediaQuery.viewInsetsOf(context).bottom + 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(child: Text(widget.line.name, style: context.text.titleLarge)),
                  AppIconButton(
                    label: context.l.close,
                    icon: Icons.close_rounded,
                    onPressed: busy ? null : () => Navigator.pop(context),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Text('${context.l.expected}: ${widget.line.expected} · ${widget.line.sku}'),
              const SizedBox(height: 24),
              AppField(
                key: const Key('quantityField'),
                controller: quantity,
                label: context.l.quantity,
                autofocus: true,
                keyboardType: TextInputType.number,
                maxLength: 7,
                onSubmitted: busy ? null : (_) => save(),
              ),
              if (error != null) ...[
                const SizedBox(height: 16),
                InfoBanner(text: error!, warning: true),
              ],
              const SizedBox(height: 24),
              AppButton(
                key: const Key('saveCount'),
                label: context.l.save,
                loading: busy,
                onPressed: save,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
