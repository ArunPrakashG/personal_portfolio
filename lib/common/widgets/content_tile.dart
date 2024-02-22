import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../helpers.dart';

class ContentTile extends StatelessWidget {
  const ContentTile({
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
    final toVertical = MediaQuery.sizeOf(context).width < 800;

    if (toVertical) {
      return SingleChildScrollView(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.sizeOf(context).width / 1.5,
                maxHeight: MediaQuery.sizeOf(context).width / 1.5,
              ),
              padding: const EdgeInsets.all(8),
              child: () {
                if (isUrl(lottie)) {
                  return Lottie.network(
                    lottie,
                    fit: BoxFit.fitWidth,
                    repeat: true,
                    renderCache: RenderCache.drawingCommands,
                    frameRate: const FrameRate(60),
                    backgroundLoading: true,
                  );
                }

                return Lottie.asset(
                  lottie,
                  fit: BoxFit.fitWidth,
                  repeat: true,
                  renderCache: RenderCache.drawingCommands,
                  frameRate: const FrameRate(60),
                  backgroundLoading: true,
                );
              }(),
            ),
            Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DefaultTextStyle(
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      child: AnimatedTextKit(
                        // ignore: avoid_redundant_argument_values
                        isRepeatingAnimation: kDebugMode,
                        animatedTexts: [
                          TypewriterAnimatedText(
                            title,
                            speed: const Duration(milliseconds: 100),
                          ),
                        ],
                      ),
                    ),
                    if (subTitle != null)
                      Text(
                        subTitle!,
                        style: GoogleFonts.poppins(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    Divider(
                      color: Colors.black87.withOpacity(0.3),
                    ),
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
              ],
            ),
          ],
        ),
      );
    }

    return Row(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DefaultTextStyle(
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  child: AnimatedTextKit(
                    // ignore: avoid_redundant_argument_values
                    isRepeatingAnimation: kDebugMode,
                    animatedTexts: [
                      TypewriterAnimatedText(
                        title,
                        speed: const Duration(milliseconds: 100),
                      ),
                    ],
                  ),
                ),
                if (subTitle != null)
                  Text(
                    subTitle!,
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                Divider(
                  color: Colors.black87.withOpacity(0.3),
                ),
                Text(
                  content,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                  ),
                ),
                if (bottom != null) ...[const SizedBox(height: 16), bottom!],
              ],
            ),
          ),
        ),
        Container(
          constraints: const BoxConstraints(
            minWidth: 300,
            minHeight: 300,
            maxHeight: 400,
            maxWidth: 400,
          ),
          padding: const EdgeInsets.all(32),
          child: () {
            if (isUrl(lottie)) {
              return Lottie.network(
                lottie,
                fit: BoxFit.fitWidth,
                repeat: true,
              );
            }

            return Lottie.asset(
              lottie,
              fit: BoxFit.fitWidth,
              repeat: true,
            );
          }(),
        ),
      ],
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
