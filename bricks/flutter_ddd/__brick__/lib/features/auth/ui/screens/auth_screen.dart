import 'package:flutter/material.dart';
import 'package:flutter_extra/features/auth/ui/providers/auth_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthScreen extends ConsumerWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Auth',
              style: TextStyle(fontSize: 24),
            ),
            ElevatedButton(
                onPressed: () {
                  ref.read(authProvider.notifier).signIn('admin', 'admin');
                },
                child: const Text('Sign In'))
          ],
        ),
      ),
    );
  }
}
