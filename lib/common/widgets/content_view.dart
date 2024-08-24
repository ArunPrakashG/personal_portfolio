import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'desktop_content_view.dart';

class ContentView extends StatelessWidget {
  const ContentView({
    required this.title,
    required this.content,
    required this.lottie,
    this.bottom,
    super.key,
    this.subTitle,
  });

  final String title;
  final String? subTitle;
  final String content;
  final Widget? bottom;
  final String lottie;

  @override
  Widget build(BuildContext context) {
    // if (MediaQuery.sizeOf(context).width < 800) {
    //   return MobileContentView(
    //     title: title,
    //     subTitle: subTitle,
    //     content: content,
    //     imageUrl: lottie,
    //     bottom: bottom,
    //   );
    // }

    return DesktopContentView(
      title: title,
      subTitle: subTitle,
      content: content,
      imageUrl: lottie,
      bottom: bottom,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('lottieUrl', lottie));
    properties.add(StringProperty('title', title));
    properties.add(StringProperty('subTitle', subTitle));
    properties.add(StringProperty('content', content));
  }
}
