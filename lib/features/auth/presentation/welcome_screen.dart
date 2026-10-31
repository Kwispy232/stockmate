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
    child: CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 88),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 540),
                child: Column(
                  children: [
                    const Expanded(child: Center(child: BrandMark(size: 80))),
                    const SizedBox(height: 24),
                    AppButton(
                      key: const Key('enterDemo'),
                      label: context.l.tryDemo,
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
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
