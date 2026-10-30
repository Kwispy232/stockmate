import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/ui/adaptive.dart';
import '../../auth/application/session.dart';
import '../../inventory/application/inventory_providers.dart';
import '../application/demo_connection.dart';
import '../application/preferences.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final workspace = ref.watch(sessionProvider);
    if (workspace == null) return const SizedBox.shrink();
    final preferences = ref.watch(preferencesProvider);
    final actions = ref.watch(inventoryActionsProvider);
    return AppPage(
      title: context.l.settings,
      child: AppScroll(
        maxWidth: 650,
        children: [
          Panel(
            child: Row(
              children: [
                const BrandMark(size: 48),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        workspace.isDemo ? context.l.localDemo : context.l.account,
                        style: context.text.titleMedium,
                      ),
                      const SizedBox(height: 6),
                      Text(workspace.isDemo ? context.l.demoHint : workspace.email ?? ''),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 28),
          _SettingsGroup(
            title: context.l.language,
            children: [
              for (final (language, label) in [
                (null, context.l.system),
                ('sk', context.l.slovak),
                ('en', context.l.english),
              ])
                _Option(
                  label: label,
                  selected: preferences.locale?.languageCode == language,
                  onTap: () => guardAction(
                    context,
                    () => ref.read(preferencesProvider.notifier).setLocale(language),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 24),
          _SettingsGroup(
            title: context.l.appearance,
            children: [
              for (final (mode, label) in [
                (ThemeMode.system, context.l.system),
                (ThemeMode.light, context.l.light),
                (ThemeMode.dark, context.l.dark),
              ])
                _Option(
                  label: label,
                  selected: preferences.theme == mode,
                  onTap: () => guardAction(
                    context,
                    () => ref.read(preferencesProvider.notifier).setTheme(mode),
                  ),
                ),
            ],
          ),
          if (workspace.isDemo) ...[
            const SizedBox(height: 24),
            Panel(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(context.l.demoConnection, style: context.text.titleMedium),
                        const SizedBox(height: 6),
                        Text(context.l.demoConnectionHint, style: context.text.bodySmall),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  Switch.adaptive(
                    key: const Key('demoConnection'),
                    value: ref.watch(demoConnectionProvider),
                    onChanged: (online) => guardAction(context, () async {
                      await ref.read(demoConnectionProvider.notifier).setOnline(online);
                      if (online) await ref.read(syncProvider.notifier).synchronize();
                    }),
                  ),
                ],
              ),
            ),
          ],
          const SizedBox(height: 24),
          AppButton(
            label: context.l.refreshCatalog,
            icon: Icons.refresh_rounded,
            secondary: true,
            loading: actions.isLoading,
            onPressed: () => guardAction(context, () async {
              await ref.read(inventoryActionsProvider.notifier).refreshCatalog();
              ref.invalidate(branchesProvider);
              if (context.mounted) await showMessage(context, context.l.catalogRefreshed);
            }),
          ),
          const SizedBox(height: 12),
          AppButton(
            key: const Key('leaveWorkspace'),
            label: workspace.isDemo ? context.l.leaveDemo : context.l.signOut,
            secondary: true,
            onPressed: actions.isLoading
                ? null
                : () => guardAction(context, () async {
                    if (await confirmAction(
                      context,
                      title: context.l.signOutTitle,
                      body: context.l.signOutBody,
                      confirm: workspace.isDemo ? context.l.leaveDemo : context.l.signOut,
                    )) {
                      await ref.read(sessionProvider.notifier).leave();
                    }
                  }),
          ),
          const SizedBox(height: 24),
          Text(context.l.about, style: context.text.bodySmall, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}

class _SettingsGroup extends StatelessWidget {
  const _SettingsGroup({required this.title, required this.children});
  final String title;
  final List<Widget> children;
  @override
  Widget build(BuildContext context) => context.isIOS
      ? CupertinoListSection.insetGrouped(
          margin: EdgeInsets.zero,
          backgroundColor: context.colors.surface,
          header: Text(title),
          children: children,
        )
      : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: context.text.titleMedium),
            const SizedBox(height: 10),
            Panel(
              padding: EdgeInsets.zero,
              child: Column(children: children),
            ),
          ],
        );
}

class _Option extends StatelessWidget {
  const _Option({required this.label, required this.selected, required this.onTap});
  final String label;
  final bool selected;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) => Semantics(
    selected: selected,
    child: context.isIOS
        ? CupertinoListTile(
            title: Text(label),
            onTap: onTap,
            trailing: selected ? const Icon(CupertinoIcons.check_mark) : null,
          )
        : ListTile(
            title: Text(label),
            onTap: onTap,
            trailing: selected ? Icon(Icons.check_rounded, color: context.colors.primary) : null,
          ),
  );
}
