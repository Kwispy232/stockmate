import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../core/ui/adaptive.dart';
import '../../auth/application/session.dart';
import '../../settings/application/demo_connection.dart';
import '../application/inventory_providers.dart';
import '../domain/inventory.dart';

class InventoryListScreen extends ConsumerStatefulWidget {
  const InventoryListScreen({super.key});
  @override
  ConsumerState<InventoryListScreen> createState() => _InventoryListScreenState();
}

class _InventoryListScreenState extends ConsumerState<InventoryListScreen>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed && ref.read(sessionProvider) != null) {
      ref.read(syncProvider.notifier).synchronize();
    }
  }

  @override
  Widget build(BuildContext context) {
    final workspace = ref.watch(sessionProvider);
    if (workspace == null) return const SizedBox.shrink();
    final inventories = ref.watch(inventoriesProvider);
    final synchronization = ref.watch(syncProvider);
    final online = !workspace.isDemo || ref.watch(demoConnectionProvider);
    return AppPage(
      title: context.l.inventories,
      canPop: false,
      trailing: AppIconButton(
        label: context.l.settings,
        icon: Icons.settings_outlined,
        onPressed: () => context.push('/settings'),
      ),
      child: inventories.when(
        loading: () => const Center(child: CircularProgressIndicator.adaptive()),
        error: (error, _) => AppScroll(
          children: [
            InfoBanner(text: errorMessage(context, error), warning: true),
            const SizedBox(height: 20),
            AppButton(label: context.l.retry, onPressed: () => ref.invalidate(inventoriesProvider)),
          ],
        ),
        data: (items) => AppScroll(
          children: [
            Row(
              children: [
                const BrandMark(size: 44),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    workspace.isDemo ? context.l.localDemo : workspace.email ?? context.l.account,
                    style: context.text.labelLarge,
                  ),
                ),
                AppIconButton(
                  label: context.l.sync,
                  icon: Icons.sync_rounded,
                  onPressed: synchronization.isLoading
                      ? null
                      : ref.read(syncProvider.notifier).synchronize,
                ),
              ],
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: Text(
                context.l.overview,
                style: context.text.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  letterSpacing: -.7,
                ),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: Text(
                context.l.overviewBody,
                style: context.text.bodyLarge?.copyWith(color: context.colors.onSurfaceVariant),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: _Metric(
                    label: context.l.activeCounts,
                    value: items.where((item) => item.status != InventoryStatus.submitted).length,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _Metric(
                    label: context.l.completedCounts,
                    value: items.where((item) => item.status == InventoryStatus.submitted).length,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            InfoBanner(
              text: !online || synchronization.hasError
                  ? context.l.offlineNotice
                  : synchronization.isLoading
                  ? context.l.syncing
                  : items.any((item) => item.status == InventoryStatus.queued)
                  ? context.l.pendingSync
                  : context.l.upToDate,
              warning: !online || synchronization.hasError,
            ),
            const SizedBox(height: 24),
            AppButton(
              key: const Key('newInventory'),
              label: context.l.newInventory,
              icon: Icons.add_rounded,
              onPressed: () => context.push('/inventories/new'),
            ),
            const SizedBox(height: 24),
            if (items.isEmpty)
              EmptyState(title: context.l.noInventories, body: context.l.noInventoriesBody)
            else
              for (final item in items) ...[_InventoryCard(item), const SizedBox(height: 12)],
          ],
        ),
      ),
    );
  }
}

class _Metric extends StatelessWidget {
  const _Metric({required this.label, required this.value});
  final String label;
  final int value;
  @override
  Widget build(BuildContext context) => Panel(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$value', style: context.text.headlineLarge?.copyWith(fontWeight: FontWeight.w700)),
        const SizedBox(height: 4),
        Text(label, style: context.text.bodyMedium),
      ],
    ),
  );
}

class _InventoryCard extends StatelessWidget {
  const _InventoryCard(this.inventory);
  final Inventory inventory;
  @override
  Widget build(BuildContext context) => Semantics(
    button: true,
    child: InkWell(
      onTap: () => context.push('/inventories/${inventory.id}'),
      borderRadius: BorderRadius.circular(20),
      child: Panel(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              spacing: 12,
              runSpacing: 10,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text(inventory.branchName, style: context.text.labelLarge),
                StatusBadge(inventory.status),
              ],
            ),
            const SizedBox(height: 14),
            Text(
              inventory.title,
              style: context.text.titleLarge?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Text(
              DateFormat.yMMMd(context.l.localeName).format(inventory.createdAt.toLocal()),
              style: context.text.bodySmall?.copyWith(color: context.colors.onSurfaceVariant),
            ),
            const SizedBox(height: 18),
            LinearProgressIndicator(
              value: inventory.lines.isEmpty ? 0 : inventory.countedLines / inventory.lines.length,
              minHeight: 5,
              borderRadius: BorderRadius.circular(10),
            ),
            const SizedBox(height: 10),
            Text(context.l.countProgress(inventory.countedLines, inventory.lines.length)),
          ],
        ),
      ),
    ),
  );
}
