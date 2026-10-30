import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/ui/adaptive.dart';
import '../application/inventory_providers.dart';
import '../domain/inventory.dart';
import 'inventory_detail_screen.dart';

class ReviewScreen extends ConsumerWidget {
  const ReviewScreen({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final all = ref.watch(inventoriesProvider);
    final inventory = all.asData?.value.where((item) => item.id == id).firstOrNull;
    if (inventory == null) return InventoryUnavailable(loading: all.isLoading);
    final busy = ref.watch(inventoryActionsProvider).isLoading;
    final editable = inventory.status == InventoryStatus.draft;
    final completed = inventory.status == InventoryStatus.submitted;
    return AppPage(
      title: context.l.review,
      child: AppScroll(
        maxWidth: 700,
        children: [
          InventorySummary(inventory),
          const SizedBox(height: 20),
          InfoBanner(
            text: completed
                ? context.l.completedBody
                : editable
                ? inventory.isComplete
                      ? context.l.reviewHint
                      : context.l.incomplete
                : context.l.queuedBody,
            warning: !completed && !inventory.isComplete,
          ),
          if (inventory.syncError != null) ...[
            const SizedBox(height: 12),
            InfoBanner(
              text: errorMessage(
                context,
                InventoryIssue.values.firstWhere(
                  (issue) => issue.name == inventory.syncError,
                  orElse: () => InventoryIssue.network,
                ),
              ),
              warning: true,
            ),
          ],
          const SizedBox(height: 24),
          if (!completed) ...[
            AppButton(
              key: const Key('submitInventory'),
              label: editable ? context.l.submit : context.l.retry,
              icon: Icons.cloud_upload_outlined,
              loading: busy,
              onPressed: editable && !inventory.isComplete
                  ? null
                  : () async {
                      if (editable &&
                          !await confirmAction(
                            context,
                            title: context.l.submitTitle,
                            body: context.l.submitBody,
                            confirm: context.l.submit,
                          )) {
                        return;
                      }
                      if (!context.mounted) return;
                      await guardAction(context, () async {
                        await ref.read(inventoryActionsProvider.notifier).submit(id);
                        ref.invalidate(syncProvider);
                      });
                    },
            ),
            const SizedBox(height: 24),
          ],
          SizedBox(
            width: double.infinity,
            child: Text(context.l.difference, style: context.text.titleLarge),
          ),
          const SizedBox(height: 12),
          if (inventory.varianceLines == 0) Text(context.l.varianceCount(0)),
          for (final line in inventory.lines.where((line) => (line.difference ?? 0) != 0)) ...[
            Panel(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(line.name, style: context.text.titleMedium),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 20,
                    runSpacing: 8,
                    children: [
                      Text('${context.l.expected}: ${line.expected}'),
                      Text('${context.l.counted}: ${line.counted}'),
                      Text(
                        '${context.l.difference}: ${line.difference! > 0 ? '+' : ''}${line.difference}',
                        style: TextStyle(color: context.colors.error, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
          ],
        ],
      ),
    );
  }
}
