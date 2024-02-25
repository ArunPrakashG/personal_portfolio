import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

final appInitProvider = FutureProvider<bool>(
  (ref) async {
    final lottieFiles = [
      'assets/lottie/capabilities.json',
      'assets/lottie/coding.json',
      'assets/lottie/experience.json',
      'assets/lottie/projects.json',
    ];

    for (final lottie in lottieFiles) {
      final byteDate = await rootBundle.load(lottie);

      await Lottie.cache.putIfAbsent(
        lottie,
        () => LottieComposition.fromByteData(byteDate),
      );
    }

    return true;
  },
);
