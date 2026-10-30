import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../features/inventory/domain/inventory.dart';
import '../../l10n/app_localizations.dart';

extension AppContext on BuildContext {
  AppLocalizations get l => AppLocalizations.of(this);
  bool get isIOS => Theme.of(this).platform == TargetPlatform.iOS;
  ColorScheme get colors => Theme.of(this).colorScheme;
  TextTheme get text => Theme.of(this).textTheme;
}

class AppPage extends StatelessWidget {
  const AppPage({
    super.key,
    required this.title,
    required this.child,
    this.trailing,
    this.canPop = true,
  });
  final String title;
  final Widget child;
  final Widget? trailing;
  final bool canPop;

  @override
  Widget build(BuildContext context) => context.isIOS
      ? CupertinoPageScaffold(
          backgroundColor: context.colors.surface,
          navigationBar: CupertinoNavigationBar(
            middle: Text(title),
            previousPageTitle: context.l.back,
            automaticallyImplyLeading: canPop,
            trailing: trailing,
            backgroundColor: context.colors.surface,
          ),
          child: SafeArea(
            child: Material(color: Colors.transparent, child: child),
          ),
        )
      : Scaffold(
          appBar: AppBar(
            title: Text(title),
            automaticallyImplyLeading: canPop,
            actions: trailing == null ? null : [trailing!, const SizedBox(width: 8)],
          ),
          body: SafeArea(top: false, child: child),
        );
}

class AppScroll extends StatelessWidget {
  const AppScroll({super.key, required this.children, this.maxWidth = 1000});
  final List<Widget> children;
  final double maxWidth;

  @override
  Widget build(BuildContext context) => ListView(
    padding: const EdgeInsets.all(24),
    children: [
      for (final child in children)
        Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: maxWidth),
            child: child,
          ),
        ),
    ],
  );
}

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.label,
    this.onPressed,
    this.icon,
    this.secondary = false,
    this.danger = false,
    this.loading = false,
  });
  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final bool secondary;
  final bool danger;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    final content = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (loading)
          const SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator.adaptive(strokeWidth: 2),
          )
        else if (icon != null)
          Icon(icon, size: 20),
        if (loading || icon != null) const SizedBox(width: 10),
        Flexible(child: Text(label, textAlign: TextAlign.center)),
      ],
    );
    final callback = loading ? null : onPressed;
    return SizedBox(
      width: double.infinity,
      child: context.isIOS
          ? CupertinoButton(
              color: danger
                  ? context.colors.error
                  : secondary
                  ? context.colors.surfaceContainerHighest
                  : context.colors.primary,
              foregroundColor: secondary ? context.colors.onSurface : Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
              borderRadius: BorderRadius.circular(14),
              onPressed: callback,
              child: content,
            )
          : FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: danger
                    ? context.colors.error
                    : secondary
                    ? context.colors.surfaceContainerHighest
                    : null,
                foregroundColor: secondary ? context.colors.onSurface : null,
                minimumSize: const Size(44, 52),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
              ),
              onPressed: callback,
              child: content,
            ),
    );
  }
}

class AppIconButton extends StatelessWidget {
  const AppIconButton({super.key, required this.label, required this.icon, this.onPressed});
  final String label;
  final IconData icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) => Tooltip(
    message: label,
    child: context.isIOS
        ? CupertinoButton(
            padding: const EdgeInsets.all(8),
            onPressed: onPressed,
            child: Semantics(label: label, button: true, child: Icon(icon, size: 24)),
          )
        : IconButton(tooltip: label, onPressed: onPressed, icon: Icon(icon)),
  );
}

class AppField extends StatelessWidget {
  const AppField({
    super.key,
    required this.controller,
    required this.label,
    this.placeholder,
    this.keyboardType,
    this.obscure = false,
    this.onChanged,
    this.onSubmitted,
    this.autofocus = false,
    this.maxLength,
    this.autofillHints,
    this.focusNode,
  });
  final TextEditingController controller;
  final String label;
  final String? placeholder;
  final TextInputType? keyboardType;
  final bool obscure;
  final bool autofocus;
  final int? maxLength;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final Iterable<String>? autofillHints;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label, style: context.text.labelLarge),
      const SizedBox(height: 8),
      if (context.isIOS)
        CupertinoTextField(
          controller: controller,
          placeholder: placeholder,
          keyboardType: keyboardType,
          obscureText: obscure,
          onChanged: onChanged,
          onSubmitted: onSubmitted,
          autofocus: autofocus,
          maxLength: maxLength,
          autofillHints: autofillHints,
          focusNode: focusNode,
          autocorrect: keyboardType == null && !obscure,
          padding: const EdgeInsets.all(15),
          style: context.text.bodyLarge,
          decoration: BoxDecoration(
            color: context.colors.surfaceContainerLowest,
            border: Border.all(color: context.colors.outlineVariant),
            borderRadius: BorderRadius.circular(12),
          ),
        )
      else
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscure,
          onChanged: onChanged,
          onSubmitted: onSubmitted,
          autofocus: autofocus,
          maxLength: maxLength,
          autofillHints: autofillHints,
          focusNode: focusNode,
          decoration: InputDecoration(
            hintText: placeholder,
            counterText: '',
            filled: true,
            fillColor: context.colors.surfaceContainerLowest,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
    ],
  );
}

class Panel extends StatelessWidget {
  const Panel({super.key, required this.child, this.padding = const EdgeInsets.all(20)});
  final Widget child;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) => Material(
    color: context.colors.surfaceContainerLowest,
    shape: RoundedRectangleBorder(
      side: BorderSide(color: context.colors.outlineVariant.withValues(alpha: .6)),
      borderRadius: BorderRadius.circular(20),
    ),
    clipBehavior: Clip.antiAlias,
    child: SizedBox(
      width: double.infinity,
      child: Padding(padding: padding, child: child),
    ),
  );
}

class BrandMark extends StatelessWidget {
  const BrandMark({super.key, this.size = 64});
  final double size;
  @override
  Widget build(BuildContext context) => SvgPicture.asset(
    'assets/brand/stockmate.svg',
    width: size,
    height: size,
    semanticsLabel: context.l.appName,
  );
}

class EmptyState extends StatelessWidget {
  const EmptyState({super.key, required this.title, required this.body, this.action});
  final String title;
  final String body;
  final Widget? action;
  @override
  Widget build(BuildContext context) => Panel(
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 28),
      child: Column(
        children: [
          const BrandMark(size: 72),
          const SizedBox(height: 24),
          Text(title, style: context.text.titleLarge, textAlign: TextAlign.center),
          const SizedBox(height: 10),
          Text(
            body,
            style: context.text.bodyMedium?.copyWith(color: context.colors.onSurfaceVariant),
            textAlign: TextAlign.center,
          ),
          if (action != null) ...[const SizedBox(height: 24), action!],
        ],
      ),
    ),
  );
}

class InfoBanner extends StatelessWidget {
  const InfoBanner({super.key, required this.text, this.warning = false});
  final String text;
  final bool warning;
  @override
  Widget build(BuildContext context) => Container(
    width: double.infinity,
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: warning ? context.colors.errorContainer : context.colors.primaryContainer,
      borderRadius: BorderRadius.circular(14),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          warning ? Icons.wifi_off_rounded : Icons.check_circle_outline_rounded,
          size: 20,
          color: warning ? context.colors.onErrorContainer : context.colors.onPrimaryContainer,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              color: warning ? context.colors.onErrorContainer : context.colors.onPrimaryContainer,
            ),
          ),
        ),
      ],
    ),
  );
}

String statusLabel(BuildContext context, InventoryStatus status) => switch (status) {
  InventoryStatus.draft => context.l.draft,
  InventoryStatus.queued => context.l.queued,
  InventoryStatus.submitted => context.l.submitted,
};

class StatusBadge extends StatelessWidget {
  const StatusBadge(this.status, {super.key});
  final InventoryStatus status;
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
    decoration: BoxDecoration(
      color: status == InventoryStatus.queued
          ? context.colors.tertiaryContainer
          : context.colors.primaryContainer,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Text(
      statusLabel(context, status),
      style: context.text.labelMedium?.copyWith(
        color: status == InventoryStatus.queued
            ? context.colors.onTertiaryContainer
            : context.colors.onPrimaryContainer,
      ),
    ),
  );
}

Future<bool> confirmAction(
  BuildContext context, {
  required String title,
  required String body,
  required String confirm,
  bool destructive = false,
}) async =>
    await (context.isIOS
        ? showCupertinoDialog<bool>(
            context: context,
            builder: (dialog) => CupertinoAlertDialog(
              title: Text(title),
              content: Text(body),
              actions: [
                CupertinoDialogAction(
                  onPressed: () => Navigator.pop(dialog, false),
                  child: Text(context.l.cancel),
                ),
                CupertinoDialogAction(
                  isDestructiveAction: destructive,
                  onPressed: () => Navigator.pop(dialog, true),
                  child: Text(confirm),
                ),
              ],
            ),
          )
        : showDialog<bool>(
            context: context,
            builder: (dialog) => AlertDialog(
              title: Text(title),
              content: Text(body),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(dialog, false),
                  child: Text(context.l.cancel),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(dialog, true),
                  child: Text(
                    confirm,
                    style: destructive ? TextStyle(color: context.colors.error) : null,
                  ),
                ),
              ],
            ),
          )) ??
    false;

Future<void> showMessage(BuildContext context, String message) => context.isIOS
    ? showCupertinoDialog(
        context: context,
        builder: (dialog) => CupertinoAlertDialog(
          content: Text(message),
          actions: [
            CupertinoDialogAction(
              onPressed: () => Navigator.pop(dialog),
              child: Text(context.l.close),
            ),
          ],
        ),
      )
    : showDialog(
        context: context,
        builder: (dialog) => AlertDialog(
          content: Text(message),
          actions: [
            TextButton(onPressed: () => Navigator.pop(dialog), child: Text(context.l.close)),
          ],
        ),
      );

String errorMessage(BuildContext context, Object error) => switch (error) {
  InventoryIssue.invalidQuantity => context.l.invalidQuantity,
  InventoryIssue.incomplete => context.l.incomplete,
  InventoryIssue.locked => context.l.locked,
  InventoryIssue.notFound => context.l.notFound,
  InventoryIssue.emptyTitle => context.l.emptyTitle,
  InventoryIssue.missingCatalog => context.l.missingCatalog,
  InventoryIssue.accessDenied => context.l.accessDenied,
  InventoryIssue.staleCatalog => context.l.staleCatalog,
  InventoryIssue.submissionChanged => context.l.submissionChanged,
  InventoryIssue.network || SocketException() || TimeoutException() => context.l.networkError,
  AuthException() => context.l.authError,
  _ => context.l.genericError,
};

Future<void> guardAction(BuildContext context, Future<void> Function() action) async {
  try {
    await action();
  } catch (error) {
    if (context.mounted) await showMessage(context, errorMessage(context, error));
  }
}
