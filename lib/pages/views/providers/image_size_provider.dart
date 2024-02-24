import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ImageSize {
  const ImageSize(this.width, this.height);

  final int width;
  final int height;
}

final imageSizeProvider = FutureProvider.autoDispose.family<ImageSize, Image>(
  (ref, image) async {
    ImageSize? imageSize;

    image.image.resolve(ImageConfiguration.empty).addListener(
      ImageStreamListener((info, call) {
        imageSize = ImageSize(info.image.width, info.image.height);
      }),
    );

    while (imageSize == null) {
      await Future.delayed(const Duration(milliseconds: 100));
    }

    return imageSize!;
  },
);
