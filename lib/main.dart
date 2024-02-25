import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app_theme.dart';
import 'pages/base_navigation_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        themeMode: ThemeMode.dark,
        title: "Arun's Portfolio",
        theme: lightTheme,
        darkTheme: darkTheme,
        home: const BaseNavigationPage(),
      ),
    );
  }
}
