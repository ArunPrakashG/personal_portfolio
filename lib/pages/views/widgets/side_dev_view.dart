import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/image_size_provider.dart';

class SideDevView extends StatelessWidget {
  const SideDevView({super.key});

  @override
  Widget build(BuildContext context) {
    final devImage = Image.asset(
      'assets/images/developer.jpg',
      fit: BoxFit.cover,
      filterQuality: FilterQuality.high,
      isAntiAlias: true,
    );

    return Positioned(
      top: 0,
      right: 0,
      bottom: 0,
      child: Consumer(
        builder: (context, ref, child) {
          final imageSize = ref.watch(imageSizeProvider(devImage));

          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: imageSize.maybeWhen(
              data: (size) {
                return Container(
                  transform: Matrix4.translationValues(
                    _getImageTranslationValue(context, size),
                    0,
                    0,
                  ),
                  foregroundDecoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF001524),
                        Colors.transparent,
                      ],
                    ),
                    border: Border.fromBorderSide(
                      BorderSide.none,
                    ),
                  ),
                  child: devImage,
                );
              },
              orElse: () => const SizedBox.shrink(),
            ),
          );
        },
      ),
    );
  }

  double _getImageTranslationValue(BuildContext context, ImageSize size) {
    final imageHalf = size.width / 2.1;
    final screenHeight = MediaQuery.sizeOf(context).height;
    final variation = () {
      if (screenHeight < 600) {
        return (600 - screenHeight).clamp(1, 50);
      } else {
        return 0;
      }
    }();

    return imageHalf * (screenHeight / (size.height + variation));
  }
}
