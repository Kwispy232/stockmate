import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/ui/adaptive.dart';
import '../application/session.dart';

class WelcomeScreen extends ConsumerStatefulWidget {
  const WelcomeScreen({super.key});
  @override
  ConsumerState<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends ConsumerState<WelcomeScreen> {
  bool busy = false;

  @override
  Widget build(BuildContext context) => AppPage(
    title: context.l.appName,
    canPop: false,
    child: AppScroll(
      maxWidth: 540,
      children: [
        const SizedBox(height: 24),
        Align(alignment: Alignment.centerLeft, child: const BrandMark(size: 80)),
        const SizedBox(height: 32),
        SizedBox(
          width: double.infinity,
          child: Text(
            context.l.welcomeTitle,
            style: context.text.displaySmall?.copyWith(
              fontWeight: FontWeight.w800,
              letterSpacing: -1.8,
            ),
          ),
        ),
        const SizedBox(height: 18),
        Text(
          context.l.welcomeBody,
          style: context.text.titleMedium?.copyWith(
            color: context.colors.onSurfaceVariant,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 30),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: const Color(0xFF123E38),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.qr_code_scanner_rounded, color: Color(0xFFDFFFAB), size: 36),
              const SizedBox(height: 28),
              Text(
                context.l.tagline,
                style: context.text.headlineSmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                context.l.demoHint,
                style: context.text.bodyMedium?.copyWith(color: Colors.white70),
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
        AppButton(
          key: const Key('enterDemo'),
          label: context.l.tryDemo,
          icon: Icons.arrow_forward_rounded,
          loading: busy,
          onPressed: () async {
            setState(() => busy = true);
            await guardAction(context, ref.read(sessionProvider.notifier).enterDemo);
            if (mounted) setState(() => busy = false);
          },
        ),
        const SizedBox(height: 12),
        AppButton(
          label: context.l.signIn,
          secondary: true,
          onPressed: busy ? null : () => context.push('/auth'),
        ),
        const SizedBox(height: 20),
      ],
    ),
  );
}
