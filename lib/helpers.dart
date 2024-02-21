import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

bool isUrl(String value) {
  final url = Uri.tryParse(value);
  return url != null && url.hasScheme && url.hasAuthority;
}

CustomTransitionPage buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}
