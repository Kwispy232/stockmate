import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../settings/application/preferences.dart';

final supabaseProvider = Provider<SupabaseClient>((ref) => Supabase.instance.client);

class Workspace {
  const Workspace(this.id, {this.isDemo = false, this.email});
  const Workspace.demo() : id = 'demo', isDemo = true, email = null;
  final String id;
  final bool isDemo;
  final String? email;
}

final sessionProvider = NotifierProvider<SessionController, Workspace?>(SessionController.new);

class SessionController extends Notifier<Workspace?> {
  SupabaseClient get _client => ref.read(supabaseProvider);

  Workspace? _workspace(User? user) => user == null ? null : Workspace(user.id, email: user.email);

  @override
  Workspace? build() {
    final subscription = _client.auth.onAuthStateChange.listen((event) {
      if (state?.isDemo != true) state = _workspace(event.session?.user);
    });
    ref.onDispose(subscription.cancel);
    return ref.read(sharedPreferencesProvider).getBool('demo') == true
        ? const Workspace.demo()
        : _workspace(_client.auth.currentUser);
  }

  Future<void> enterDemo() async {
    await ref.read(sharedPreferencesProvider).setBool('demo', true);
    state = const Workspace.demo();
  }

  Future<void> signIn(String email, String password) async {
    final response = await _client.auth.signInWithPassword(email: email.trim(), password: password);
    await ref.read(sharedPreferencesProvider).setBool('demo', false);
    state = _workspace(response.user);
  }

  Future<bool> signUp(String email, String password) async {
    final response = await _client.auth.signUp(email: email.trim(), password: password);
    if (response.session == null) return false;
    await ref.read(sharedPreferencesProvider).setBool('demo', false);
    state = _workspace(response.user);
    return true;
  }

  Future<void> leave() async {
    if (state?.isDemo != true) await _client.auth.signOut(scope: SignOutScope.local);
    await ref.read(sharedPreferencesProvider).setBool('demo', false);
    state = null;
  }
}
