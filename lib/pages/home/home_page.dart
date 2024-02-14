import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:circular_clip_route/circular_clip_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../skills/skills_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Home',
              style: GoogleFonts.poppins(
                fontSize: 16,
              ),
            ),
          ),
          Builder(
            builder: (context) {
              return TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    CircularClipRoute(
                      expandFrom: context,
                      builder: (context) => const SkillsPage(),
                      transitionDuration: const Duration(milliseconds: 900),
                    ),
                  );
                },
                child: Text(
                  'Skills',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                  ),
                ),
              );
            },
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Projects',
              style: GoogleFonts.poppins(
                fontSize: 16,
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Contact',
              style: GoogleFonts.poppins(
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/background.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Builder(
                builder: (context) {
                  final toVertical = MediaQuery.sizeOf(context).width < 800;
                  const rightAnimation =
                      'https://lottie.host/614e4189-90bd-4fb2-b783-7be3c09d220e/f3TNa4gKkZ.json';

                  if (toVertical) {
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
                            rightAnimation,
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
                            const Divider(),
                            Text(
                              "Emerging from the picturesque terrains of Kerala, I excel in Mobile & Desktop Application Development. With proficiency in Flutter & Xamarin.Forms Frameworks, I've also engineered production-ready libraries.",
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                              ),
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
                            const Divider(),
                            Text(
                              "Emerging from the picturesque terrains of Kerala, I excel in Mobile & Desktop Application Development. With proficiency in Flutter & Xamarin.Forms Frameworks, I've also engineered production-ready libraries.",
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                              ),
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
                          rightAnimation,
                          fit: BoxFit.fitWidth,
                          repeat: true,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
