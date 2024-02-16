import 'package:circular_clip_route/circular_clip_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../pages/capabilities/capabilities_page.dart';
import '../../pages/experience/experience_page.dart';
import '../../pages/home/home_page.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      leading: const SizedBox.shrink(),
      actions: [
        TextButton(
          onPressed: () => _onHomeTapped(context),
          child: Text(
            'Home'.toLowerCase(),
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Builder(
          builder: (context) {
            return TextButton(
              onPressed: () => _onCapabilitiesTapped(context),
              child: Text(
                'Capabilities'.toLowerCase(),
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            );
          },
        ),
        Builder(
          builder: (context) {
            return TextButton(
              onPressed: () => _onExperienceTapped(context),
              child: Text(
                'Experience'.toLowerCase(),
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            );
          },
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'Projects'.toLowerCase(),
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'Contact'.toLowerCase(),
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  void _onCapabilitiesTapped(BuildContext context) {
    Navigator.pushReplacement(
      context,
      CircularClipRoute(
        expandFrom: context,
        builder: (context) => const CapabilitiesPage(),
        transitionDuration: const Duration(milliseconds: 900),
      ),
    );
  }

  void _onHomeTapped(BuildContext context) {
    Navigator.pushReplacement(
      context,
      CircularClipRoute(
        expandFrom: context,
        builder: (context) => const HomePage(),
        transitionDuration: const Duration(milliseconds: 900),
      ),
    );
  }

  void _onExperienceTapped(BuildContext context) {
    Navigator.pushReplacement(
      context,
      CircularClipRoute(
        expandFrom: context,
        builder: (context) => const ExperiencePage(),
        transitionDuration: const Duration(milliseconds: 900),
      ),
    );
  }
}
