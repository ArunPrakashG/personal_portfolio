import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'helpers.dart';
import 'pages/capabilities/capabilities_page.dart';
import 'pages/experience/experience_page.dart';
import 'pages/home/home_page.dart';
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
      path: HOME_ROUTE,
      name: 'home',
      pageBuilder: (context, state) {
        return buildPageWithDefaultTransition(
          child: const HomePage(),
          context: context,
          state: state,
        );
      },
    ),
    GoRoute(
      path: CAPABILITIES_ROUTE,
      name: 'capabilities',
      pageBuilder: (context, state) {
        return buildPageWithDefaultTransition(
          child: const CapabilitiesPage(),
          context: context,
          state: state,
        );
      },
    ),
    GoRoute(
      path: EXPERIENCE_ROUTE,
      name: 'experience',
      pageBuilder: (context, state) {
        return buildPageWithDefaultTransition(
          child: const ExperiencePage(),
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
        title: "Arun's Portfolio",
        theme: FlexThemeData.light(scheme: FlexScheme.mandyRed),
        darkTheme: FlexThemeData.dark(scheme: FlexScheme.mandyRed),
        themeMode: ThemeMode.light,
      ),
    );
  }
}
