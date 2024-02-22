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
        themeMode: ThemeMode.light,
        title: "Arun's Portfolio",
        // Theme config for FlexColorScheme version 7.3.x. Make sure you use
// same or higher package version, but still same major version. If you
// use a lower package version, some properties may not be supported.
// In that case remove them after copying this theme to your app.
        theme: FlexThemeData.light(
          colors: const FlexSchemeColor(
            primary: Color(0xff004881),
            primaryContainer: Color(0xffd3e4ff),
            secondary: Color(0xffcf4b20),
            secondaryContainer: Color(0xffffdbcf),
            tertiary: Color(0xff006875),
            tertiaryContainer: Color(0xff9defff),
            appBarColor: Color(0xffffdbcf),
            error: Color(0xffb00020),
          ),
          usedColors: 1,
          appBarStyle: FlexAppBarStyle.background,
          tooltipsMatchBackground: true,
          subThemesData: const FlexSubThemesData(
            blendOnLevel: 10,
            blendOnColors: false,
            useM2StyleDividerInM3: true,
            defaultRadius: 22,
            elevatedButtonSchemeColor: SchemeColor.onPrimaryContainer,
            elevatedButtonSecondarySchemeColor: SchemeColor.primaryContainer,
            segmentedButtonSchemeColor: SchemeColor.primary,
            inputDecoratorSchemeColor: SchemeColor.primary,
            inputDecoratorBackgroundAlpha: 21,
            inputDecoratorRadius: 8,
            inputDecoratorUnfocusedHasBorder: false,
            inputDecoratorPrefixIconSchemeColor: SchemeColor.primary,
            fabUseShape: true,
            popupMenuRadius: 6,
            popupMenuElevation: 4,
            alignedDropdown: true,
            dialogElevation: 3,
            dialogRadius: 20,
            useInputDecoratorThemeInDialogs: true,
            drawerIndicatorSchemeColor: SchemeColor.primary,
            bottomNavigationBarMutedUnselectedLabel: false,
            bottomNavigationBarMutedUnselectedIcon: false,
            menuRadius: 6,
            menuElevation: 4,
            menuBarRadius: 0,
            menuBarElevation: 1,
            menuBarShadowColor: Color(0x00000000),
            navigationBarSelectedLabelSchemeColor: SchemeColor.primary,
            navigationBarMutedUnselectedLabel: false,
            navigationBarSelectedIconSchemeColor: SchemeColor.onPrimary,
            navigationBarMutedUnselectedIcon: false,
            navigationBarIndicatorSchemeColor: SchemeColor.primary,
            navigationBarIndicatorOpacity: 1,
            navigationBarBackgroundSchemeColor: SchemeColor.background,
            navigationBarElevation: 0,
            navigationRailSelectedLabelSchemeColor: SchemeColor.primary,
            navigationRailMutedUnselectedLabel: false,
            navigationRailSelectedIconSchemeColor: SchemeColor.onPrimary,
            navigationRailMutedUnselectedIcon: false,
            navigationRailIndicatorSchemeColor: SchemeColor.primary,
            navigationRailIndicatorOpacity: 1,
          ),
          keyColors: const FlexKeyColors(
            useSecondary: true,
            useTertiary: true,
            keepPrimary: true,
            keepSecondary: true,
            keepTertiary: true,
            keepPrimaryContainer: true,
            keepSecondaryContainer: true,
            keepTertiaryContainer: true,
          ),
          tones: FlexTones.oneHue(Brightness.light),
          visualDensity: VisualDensity.comfortable,
          useMaterial3: true,
          // To use the Playground font, add GoogleFonts package and uncomment
          // fontFamily: GoogleFonts.notoSans().fontFamily,
        ),
        darkTheme: FlexThemeData.dark(
          colors: const FlexSchemeColor(
            primary: Color(0xff9fc9ff),
            primaryContainer: Color(0xff00325b),
            secondary: Color(0xffffb59d),
            secondaryContainer: Color(0xff872100),
            tertiary: Color(0xff86d2e1),
            tertiaryContainer: Color(0xff004e59),
            appBarColor: Color(0xff872100),
            error: Color(0xffcf6679),
          ),
          usedColors: 1,
          surfaceMode: FlexSurfaceMode.highBackgroundLowScaffold,
          blendLevel: 4,
          appBarStyle: FlexAppBarStyle.background,
          tooltipsMatchBackground: true,
          subThemesData: const FlexSubThemesData(
            blendOnLevel: 10,
            blendTextTheme: true,
            useM2StyleDividerInM3: true,
            defaultRadius: 22,
            elevatedButtonSchemeColor: SchemeColor.onPrimaryContainer,
            elevatedButtonSecondarySchemeColor: SchemeColor.primaryContainer,
            segmentedButtonSchemeColor: SchemeColor.primary,
            inputDecoratorSchemeColor: SchemeColor.primary,
            inputDecoratorBackgroundAlpha: 43,
            inputDecoratorRadius: 8,
            inputDecoratorUnfocusedHasBorder: false,
            inputDecoratorPrefixIconSchemeColor: SchemeColor.primary,
            fabUseShape: true,
            popupMenuRadius: 6,
            popupMenuElevation: 4,
            alignedDropdown: true,
            dialogElevation: 3,
            dialogRadius: 20,
            useInputDecoratorThemeInDialogs: true,
            drawerIndicatorSchemeColor: SchemeColor.primary,
            bottomNavigationBarMutedUnselectedLabel: false,
            bottomNavigationBarMutedUnselectedIcon: false,
            menuRadius: 6,
            menuElevation: 4,
            menuBarRadius: 0,
            menuBarElevation: 1,
            menuBarShadowColor: Color(0x00000000),
            navigationBarSelectedLabelSchemeColor: SchemeColor.primary,
            navigationBarMutedUnselectedLabel: false,
            navigationBarSelectedIconSchemeColor: SchemeColor.onPrimary,
            navigationBarMutedUnselectedIcon: false,
            navigationBarIndicatorSchemeColor: SchemeColor.primary,
            navigationBarIndicatorOpacity: 1,
            navigationBarBackgroundSchemeColor: SchemeColor.background,
            navigationBarElevation: 0,
            navigationRailSelectedLabelSchemeColor: SchemeColor.primary,
            navigationRailMutedUnselectedLabel: false,
            navigationRailSelectedIconSchemeColor: SchemeColor.onPrimary,
            navigationRailMutedUnselectedIcon: false,
            navigationRailIndicatorSchemeColor: SchemeColor.primary,
            navigationRailIndicatorOpacity: 1,
          ),
          keyColors: const FlexKeyColors(
            useSecondary: true,
            useTertiary: true,
          ),
          tones: FlexTones.oneHue(Brightness.dark),
          visualDensity: VisualDensity.comfortable,
          useMaterial3: true,
          // To use the Playground font, add GoogleFonts package and uncomment
          // fontFamily: GoogleFonts.notoSans().fontFamily,
        ),
// If you do not have a themeMode switch, uncomment this line
// to let the device system mode control the theme mode:
// themeMode: ThemeMode.system,
      ),
    );
  }
}
