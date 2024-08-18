import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MobileContentView extends StatelessWidget {
  const MobileContentView({
    required this.title,
    required this.content,
    required this.imageUrl,
    this.bottom,
    super.key,
    this.subTitle,
  });

  final String title;
  final String? subTitle;
  final String content;
  final Widget? bottom;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          child: Image.asset(
            imageUrl,
            fit: BoxFit.fitWidth,
          ),
        ),
        ListTile(
          title: DefaultTextStyle(
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            child: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  title,
                  textAlign: TextAlign.left,
                  speed: const Duration(milliseconds: 100),
                ),
              ],
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                content,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                ),
              ),
              if (bottom != null) ...[
                const SizedBox(height: 16),
                bottom!,
              ],
            ],
          ),
        ),
      ],
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('title', title));
    properties.add(StringProperty('subTitle', subTitle));
    properties.add(StringProperty('content', content));
    properties.add(StringProperty('lottie', imageUrl));
  }
}
