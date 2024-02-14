import 'package:circular_clip_route/circular_clip_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../skills/skills_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final textAllocatedSpace = MediaQuery.sizeOf(context).width / 2;

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
      body: Padding(
        padding: EdgeInsets.only(
          left: 32,
          right: screenWidth < 800 ? 32 : textAllocatedSpace,
          top: 32,
          bottom: 32,
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Hey there! I'm Arun Prakash",
                    style: GoogleFonts.poppins(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
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
          ],
        ),
      ),
    );
  }
}
