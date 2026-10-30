import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../core/ui/adaptive.dart';
import '../application/inventory_providers.dart';
import '../domain/inventory.dart';

class NewInventoryScreen extends ConsumerStatefulWidget {
  const NewInventoryScreen({super.key});
  @override
  ConsumerState<NewInventoryScreen> createState() => _NewInventoryScreenState();
}

class _NewInventoryScreenState extends ConsumerState<NewInventoryScreen> {
  final title = TextEditingController();
  String? branchId;
  bool initialized = false;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!initialized) {
      title.text = context.l.inventoryDefaultTitle(
        DateFormat.MMMd(context.l.localeName).format(DateTime.now()),
      );
      initialized = true;
    }
  }

  @override
  void dispose() {
    title.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final branches = ref.watch(branchesProvider);
    final busy = ref.watch(inventoryActionsProvider).isLoading;
    return AppPage(
      title: context.l.newInventory,
      child: branches.when(
        loading: () => const Center(child: CircularProgressIndicator.adaptive()),
        error: (error, _) => AppScroll(
          maxWidth: 600,
          children: [
            InfoBanner(text: errorMessage(context, error), warning: true),
            const SizedBox(height: 20),
            AppButton(label: context.l.retry, onPressed: () => ref.invalidate(branchesProvider)),
          ],
        ),
        data: (stores) {
          if (stores.isEmpty) return Center(child: Text(context.l.missingCatalog));
          final selected = stores.firstWhere(
            (store) => store.id == branchId,
            orElse: () => stores.first,
          );
          return AppScroll(
            maxWidth: 600,
            children: [
              AppField(
                key: const Key('inventoryName'),
                controller: title,
                label: context.l.titleLabel,
                placeholder: context.l.titleHint,
                maxLength: 80,
              ),
              const SizedBox(height: 28),
              SizedBox(
                width: double.infinity,
                child: Text(context.l.branch, style: context.text.titleMedium),
              ),
              const SizedBox(height: 12),
              for (final store in stores) ...[
                _BranchOption(
                  branch: store,
                  selected: store.id == selected.id,
                  onTap: busy ? null : () => setState(() => branchId = store.id),
                ),
                const SizedBox(height: 12),
              ],
              const SizedBox(height: 20),
              AppButton(
                key: const Key('createInventory'),
                label: context.l.createInventory,
                icon: Icons.arrow_forward_rounded,
                loading: busy,
                onPressed: () => guardAction(context, () async {
                  final inventory = await ref
                      .read(inventoryActionsProvider.notifier)
                      .create(selected, title.text);
                  if (context.mounted) context.replace('/inventories/${inventory.id}');
                }),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _BranchOption extends StatelessWidget {
  const _BranchOption({required this.branch, required this.selected, this.onTap});
  final Branch branch;
  final bool selected;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) => Semantics(
    selected: selected,
    button: true,
    child: InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Panel(
        child: Row(
          children: [
            Icon(Icons.storefront_rounded, color: context.colors.primary),
            const SizedBox(width: 16),
            Expanded(child: Text(branch.name, style: context.text.titleMedium)),
            const SizedBox(width: 12),
            Icon(
              selected
                  ? context.isIOS
                        ? CupertinoIcons.check_mark_circled_solid
                        : Icons.radio_button_checked
                  : Icons.radio_button_unchecked,
              color: context.colors.primary,
            ),
          ],
        ),
      ),
    ),
  );
}
