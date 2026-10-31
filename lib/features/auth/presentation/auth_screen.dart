import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/ui/adaptive.dart';
import '../application/session.dart';

class AuthScreen extends ConsumerStatefulWidget {
  const AuthScreen({super.key});
  @override
  ConsumerState<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends ConsumerState<AuthScreen> {
  final email = TextEditingController();
  final password = TextEditingController();
  bool busy = false;
  bool passwordVisible = false;
  String? error;

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  Future<void> authenticate({bool register = false}) async {
    FocusScope.of(context).unfocus();
    if (!RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$').hasMatch(email.text.trim()) ||
        password.text.length < 6) {
      setState(() => error = context.l.invalidEmail);
      return;
    }
    setState(() {
      busy = true;
      error = null;
    });
    try {
      final session = ref.read(sessionProvider.notifier);
      if (register) {
        final signedIn = await session.signUp(email.text, password.text);
        if (!signedIn && mounted) await showMessage(context, context.l.checkEmail);
      } else {
        await session.signIn(email.text, password.text);
      }
    } catch (issue) {
      if (mounted) setState(() => error = errorMessage(context, issue));
    } finally {
      if (mounted) setState(() => busy = false);
    }
  }

  @override
  Widget build(BuildContext context) => AppPage(
    title: context.l.signIn,
    child: AutofillGroup(
      child: AppScroll(
        maxWidth: 540,
        children: [
          const SizedBox(height: 20),
          const BrandMark(),
          const SizedBox(height: 28),
          AppField(
            key: const Key('emailField'),
            controller: email,
            label: context.l.email,
            keyboardType: TextInputType.emailAddress,
            autofillHints: const [AutofillHints.email],
          ),
          const SizedBox(height: 20),
          AppField(
            key: const Key('passwordField'),
            controller: password,
            label: context.l.password,
            keyboardType: TextInputType.visiblePassword,
            obscure: !passwordVisible,
            suffix: AppIconButton(
              label: passwordVisible ? context.l.hidePassword : context.l.showPassword,
              icon: context.isIOS
                  ? passwordVisible
                        ? CupertinoIcons.eye_slash
                        : CupertinoIcons.eye
                  : passwordVisible
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
              onPressed: () => setState(() => passwordVisible = !passwordVisible),
            ),
            autofillHints: const [AutofillHints.password],
            onSubmitted: busy ? null : (_) => authenticate(),
          ),
          const SizedBox(height: 24),
          if (error != null) ...[
            InfoBanner(text: error!, warning: true),
            const SizedBox(height: 20),
          ],
          AppButton(label: context.l.signIn, loading: busy, onPressed: authenticate),
          const SizedBox(height: 12),
          AppButton(
            label: context.l.createAccount,
            secondary: true,
            onPressed: busy ? null : () => authenticate(register: true),
          ),
        ],
      ),
    ),
  );
}
