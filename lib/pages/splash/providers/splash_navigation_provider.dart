import 'package:flutter_riverpod/flutter_riverpod.dart';

final splashNavigationProvider = FutureProvider.autoDispose<bool>(
  (ref) async {
    return Future.delayed(const Duration(seconds: 2), () => true);
  },
);
