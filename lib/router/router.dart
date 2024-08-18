import 'package:go_router/go_router.dart';

import '../pages/scaffold.dart';
import '../pages/user_dashboard.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return MainScaffold(child: child);
      },
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => DashboardPage(),
        ),
        // GoRoute(
        //   path: '/league',
        //   builder: (context, state) => LeaguePage(),
        // ),
        // GoRoute(
        //   path: '/players',
        //   builder: (context, state) => PlayersPage(),
        // ),
        // GoRoute(
        //   path: '/settings',
        //   builder: (context, state) => SettingsPage(),
        // ),
      ],
    ),
  ],
);
