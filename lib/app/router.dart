import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../core/ui/adaptive.dart';
import '../features/auth/application/session.dart';
import '../features/auth/presentation/auth_screen.dart';
import '../features/auth/presentation/welcome_screen.dart';
import '../features/inventory/presentation/inventory_detail_screen.dart';
import '../features/inventory/presentation/inventory_list_screen.dart';
import '../features/inventory/presentation/new_inventory_screen.dart';
import '../features/inventory/presentation/review_screen.dart';
import '../features/inventory/presentation/scanner_screen.dart';
import '../features/settings/presentation/settings_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final refresh = ValueNotifier(0);
  ref.listen(sessionProvider, (_, _) => refresh.value++);
  final router = GoRouter(
    initialLocation: '/inventories',
    refreshListenable: refresh,
    redirect: (context, state) {
      final signedIn = ref.read(sessionProvider) != null;
      final public = state.uri.path == '/welcome' || state.uri.path == '/auth';
      if (!signedIn && !public) return '/welcome';
      if (signedIn && public) return '/inventories';
      return null;
    },
    routes: [
      _route('/welcome', (_, _) => const WelcomeScreen()),
      _route('/auth', (_, _) => const AuthScreen()),
      GoRoute(path: '/', redirect: (_, _) => '/inventories'),
      _route(
        '/inventories',
        (_, _) => const InventoryListScreen(),
        routes: [
          _route('new', (_, _) => const NewInventoryScreen()),
          _route(
            ':id',
            (_, state) => InventoryDetailScreen(id: state.pathParameters['id']!),
            routes: [
              _route('scan', (_, state) => ScannerScreen(id: state.pathParameters['id']!)),
              _route('review', (_, state) => ReviewScreen(id: state.pathParameters['id']!)),
            ],
          ),
        ],
      ),
      _route('/settings', (_, _) => const SettingsScreen()),
    ],
    errorBuilder: (context, _) => AppPage(
      title: context.l.appName,
      child: AppScroll(
        children: [
          Text(context.l.notFound),
          const SizedBox(height: 20),
          AppButton(label: context.l.back, onPressed: () => context.go('/inventories')),
        ],
      ),
    ),
  );
  ref.onDispose(() {
    router.dispose();
    refresh.dispose();
  });
  return router;
});

GoRoute _route(
  String path,
  Widget Function(BuildContext, GoRouterState) builder, {
  List<RouteBase> routes = const [],
}) => GoRoute(
  path: path,
  routes: routes,
  pageBuilder: (context, state) => context.isIOS
      ? CupertinoPage(key: state.pageKey, child: builder(context, state))
      : MaterialPage(key: state.pageKey, child: builder(context, state)),
);
