import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'app_theme.dart';
import 'pages/base_navigation_page.dart';

void main() {
  final binding = WidgetsFlutterBinding.ensureInitialized();
  final context = binding.rootElement as BuildContext?;

  if (context != null) {
    unawaited(
      _cacheAssets(context),
    );
  }

  runApp(const MainApp());
}

Future<void> _cacheAssets(BuildContext context) async {
  final images = [
    'assets/images/capabilities.png',
    'assets/images/coding.png',
    'assets/images/experience.png',
    'assets/images/projects.png',
    'assets/images/developer.png',
  ];

  for (final lottie in images) {
    await precacheImage(AssetImage(lottie), context);
  }

  final svgs = [
    'assets/icons/apple.svg',
    'assets/icons/git.svg',
    'assets/icons/csharp.svg',
    'assets/icons/flutter.svg',
    'assets/icons/dart.svg',
    'assets/icons/firebase.svg',
    'assets/icons/oculus.svg',
    'assets/icons/unity.svg',
    'assets/icons/wordpress.svg',
    'assets/icons/xamarin.svg',
  ];

  for (final svgFile in svgs) {
    final loader = SvgAssetLoader(svgFile);
    await svg.cache
        .putIfAbsent(loader.cacheKey(null), () => loader.loadBytes(null));
  }
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
        home: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: const BaseNavigationPage(),
        ),
      ),
    );
  }
}
