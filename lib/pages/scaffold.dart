import 'package:adaptive_navigation/adaptive_navigation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainScaffold extends StatelessWidget {
  final Widget child;

  const MainScaffold({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AdaptiveNavigationScaffold(
        selectedIndex: _calculateSelectedIndex(context),
        body: child,
        onDestinationSelected: (int index) {
          switch (index) {
            case 0:
              context.go('/');
              break;
            case 1:
              context.go('/league');
              break;
            case 2:
              context.go('/players');
              break;
            case 3:
              context.go('/settings');
              break;
          }
        },
        destinations: const [
          AdaptiveScaffoldDestination(
            title: 'Accueil',
            icon: Icons.home,
          ),
          AdaptiveScaffoldDestination(
            title: 'Poules',
            icon: Icons.sports_tennis,
          ),
          AdaptiveScaffoldDestination(
            title: 'Joueurs',
            icon: Icons.people,
          ),
          AdaptiveScaffoldDestination(
            title: 'Paramètres',
            icon: Icons.settings,
          ),
        ],
      ),
    );
  }

  int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.path;
    // final String location = GoRouterState.of(context).location;
    if (location.startsWith('/league')) {
      return 1;
    }
    if (location.startsWith('/players') || location.startsWith('/player/')) {
      return 2;
    }
    if (location.startsWith('/settings')) {
      return 3;
    }
    return 0;
  }
}
