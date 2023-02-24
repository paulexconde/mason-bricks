import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '/features/auth/ui/providers/auth_provider.dart';
import '/routing/states.dart';
import '/routing/tabs.dart';

class BaseScaffold extends ConsumerStatefulWidget {
  const BaseScaffold({super.key, required this.child});

  final Widget child;

  @override
  ConsumerState<BaseScaffold> createState() => _BaseScaffoldState();
}

class _BaseScaffoldState extends ConsumerState<BaseScaffold> {
  int get _currentIndex => _locationToTabIndex(GoRouter.of(context).location);

  int _locationToTabIndex(String location) {
    final index = tabs.indexWhere((tab) => location.startsWith(tab.path));

    return index < 0 ? 0 : index;
  }

  void _onTabTapped(BuildContext context, int tabIndex, WidgetRef ref) {
    if (tabIndex != _currentIndex) {
      ref.read(routeTitleProvider.notifier).state = tabs[tabIndex].title;
      context.go(tabs[tabIndex].path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Image.asset(
          'assets/images/ssd-horizontal-logo.png',
          width: 150,
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.settings_outlined)),
          IconButton(
              onPressed: () {
                ref.read(authProvider.notifier).signOut();
              },
              icon: const Icon(Icons.logout)),
        ],
      ),
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        items: tabs,
        currentIndex: _currentIndex,
        onTap: (index) {
          _onTabTapped(context, index, ref);
        },
      ),
    );
  }
}
