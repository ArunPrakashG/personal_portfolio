import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

const _rightAnimation =
    'https://lottie.host/614e4189-90bd-4fb2-b783-7be3c09d220e/f3TNa4gKkZ.json';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key, this.vertical = false});

  final bool vertical;

  @override
  Widget build(BuildContext context) {
    if (vertical) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.sizeOf(context).width / 1.5,
              maxHeight: MediaQuery.sizeOf(context).width / 1.5,
            ),
            padding: const EdgeInsets.all(16),
            child: Lottie.network(
              _rightAnimation,
              fit: BoxFit.fitWidth,
              repeat: true,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DefaultTextStyle(
                style: GoogleFonts.poppins(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                child: AnimatedTextKit(
                  // ignore: avoid_redundant_argument_values
                  isRepeatingAnimation: kDebugMode,
                  animatedTexts: [
                    TypewriterAnimatedText(
                      "Hey there! I'm Arun Prakash",
                      speed: const Duration(milliseconds: 200),
                    ),
                  ],
                ),
              ),
              Text(
                'A Senior Software Engineer',
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Divider(
                color: Colors.black87.withOpacity(0.3),
              ),
              Text(
                "Emerging from the picturesque terrains of Kerala, I excel in Mobile & Desktop Application Development. With proficiency in Flutter & Xamarin.Forms Frameworks, I've also engineered production-ready libraries.",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                ),
              ),
              ButtonBar(
                alignment: MainAxisAlignment.start,
                buttonPadding: EdgeInsets.zero,
                layoutBehavior: ButtonBarLayoutBehavior.constrained,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.facebook,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.mail,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.phone,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ],
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DefaultTextStyle(
                style: GoogleFonts.poppins(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                child: AnimatedTextKit(
                  // ignore: avoid_redundant_argument_values
                  isRepeatingAnimation: kDebugMode,
                  animatedTexts: [
                    TypewriterAnimatedText(
                      "Hey there! I'm Arun Prakash",
                      speed: const Duration(milliseconds: 200),
                    ),
                  ],
                ),
              ),
              Text(
                'A Senior Software Engineer',
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Divider(
                color: Colors.black87.withOpacity(0.3),
              ),
              Text(
                "Emerging from the picturesque terrains of Kerala, I excel in Mobile & Desktop Application Development. With proficiency in Flutter & Xamarin.Forms Frameworks, I've also engineered production-ready libraries.",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                ),
              ),
              ButtonBar(
                alignment: MainAxisAlignment.start,
                buttonPadding: EdgeInsets.zero,
                layoutBehavior: ButtonBarLayoutBehavior.constrained,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.facebook,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.mail,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.phone,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          constraints: const BoxConstraints(
            minWidth: 300,
            minHeight: 300,
            maxHeight: 400,
            maxWidth: 400,
          ),
          padding: const EdgeInsets.all(16),
          child: Lottie.network(
            _rightAnimation,
            fit: BoxFit.fitWidth,
            repeat: true,
          ),
        ),
      ],
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<bool>('vertical', vertical));
  }
}
