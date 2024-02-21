import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_shaders/flutter_shaders.dart';
import 'package:lottie/lottie.dart';

import '../../../constants.dart';

final splashNavigationProvider = FutureProvider.autoDispose<bool>(
  (ref) async {
    final lottieFiles = [
      'assets/lottie/build.json',
      'assets/lottie/capabilities.json',
      'assets/lottie/coding-skills.json',
      'assets/lottie/coding.json',
      'assets/lottie/experience.json',
    ];

    for (final lottie in lottieFiles) {
      final byteDate = await rootBundle.load(lottie);

      await Lottie.cache.putIfAbsent(
        lottie,
        () => LottieComposition.fromByteData(byteDate),
      );
    }

    await Future(() async {
      try {
        await ShaderBuilder.precacheShader(shaderAssetPath);
      } catch (e) {
        debugPrint('[AnimatedMeshGradient] [Exception] Precaching Shader: $e');
        debugPrintStack(stackTrace: StackTrace.current);
      }
    });

    return true;
  },
);
