import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'app_theme.dart';
import 'helpers.dart';
import 'pages/base_navigation_page.dart';
import 'pages/splash/splash_page.dart';
import 'routes.dart';

final _router = GoRouter(
  routes: [
    GoRoute(
      path: SPLASH_ROUTE,
      name: 'splash',
      pageBuilder: (context, state) {
        return buildPageWithDefaultTransition(
          child: const SplashPage(),
          context: context,
          state: state,
        );
      },
    ),
    GoRoute(
      path: BASE_ROUTE,
      name: 'base',
      pageBuilder: (context, state) {
        return buildPageWithDefaultTransition(
          child: const BaseNavigationPage(),
          context: context,
          state: state,
        );
      },
    ),
  ],
);

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp.router(
        routerConfig: _router,
        themeMode: ThemeMode.dark,
        title: "Arun's Portfolio",
        theme: lightTheme,
        darkTheme: darkTheme,
      ),
    );
  }
}
