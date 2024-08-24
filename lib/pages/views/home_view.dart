import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../common/widgets/hover_icon.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    const iconSize = 28.0;

    final screenWidth = MediaQuery.sizeOf(context).width;
    final isMobile = screenWidth <= 850;

    if (isMobile) {
      return Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 80,
              foregroundImage: AssetImage('assets/images/developer.jpg'),
            ),
            const SizedBox(height: 32),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                  TextSpan(
                    text: '',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    children: [
                      TextSpan(
                        text: 'Hi!👋\n',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: "I'm",
                        style: GoogleFonts.poppins(
                          fontSize: 28,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: ' Arun Prakash\n',
                        style: GoogleFonts.poppins(
                          fontSize: 42,
                          color: Colors.blue,
                          fontWeight: FontWeight.w800,
                          shadows: [
                            const BoxShadow(
                              color: Colors.black38,
                              blurRadius: 4,
                              spreadRadius: 3,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                      ),
                      TextSpan(
                        text:
                            'A Software Engineer. I love building things and helping people.',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    HoverIcon(
                      icon: const Icon(
                        AntDesign.mail_outline,
                        size: iconSize,
                      ),
                      hoverIcon: Brand(
                        Brands.gmail,
                        size: iconSize,
                      ),
                      onPressed: () => _launchSocialMediaUrl(
                        'mailto:arun.prakash.456789@gmail.com',
                      ),
                    ),
                    HoverIcon(
                      icon: const Icon(
                        AntDesign.github_outline,
                        size: iconSize,
                      ),
                      hoverIcon: Brand(
                        Brands.github,
                        size: iconSize,
                      ),
                      onPressed: () => _launchSocialMediaUrl(
                        'https://github.com/ArunPrakashG',
                      ),
                    ),
                    HoverIcon(
                      icon: const Icon(
                        AntDesign.linkedin_outline,
                        size: iconSize,
                      ),
                      hoverIcon: Brand(
                        Brands.linkedin,
                        size: iconSize,
                      ),
                      onPressed: () => _launchSocialMediaUrl(
                        'https://www.linkedin.com/in/arunprakashg/',
                      ),
                    ),
                    HoverIcon(
                      icon: const Icon(
                        AntDesign.twitter_outline,
                        size: iconSize,
                      ),
                      hoverIcon: Brand(
                        Brands.twitter,
                        size: iconSize,
                      ),
                      onPressed: () => _launchSocialMediaUrl(
                        'https://twitter.com/_arunprakash_',
                      ),
                    ),
                    HoverIcon(
                      icon: const Icon(
                        AntDesign.facebook_outline,
                        size: iconSize,
                      ),
                      hoverIcon: Brand(
                        Brands.facebook,
                        size: iconSize,
                      ),
                      onPressed: () => _launchSocialMediaUrl(
                        'https://www.facebook.com/arunprakash.i/',
                      ),
                    ),
                    HoverIcon(
                      icon: const Icon(
                        AntDesign.instagram_outline,
                        size: iconSize,
                      ),
                      hoverIcon: Brand(
                        Brands.instagram,
                        size: iconSize,
                      ),
                      onPressed: () => _launchSocialMediaUrl(
                        'https://www.instagram.com/i.arunprakash',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  text: '',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  children: [
                    TextSpan(
                      text: 'Hi!👋\n',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextSpan(
                      text: "I'm",
                      style: GoogleFonts.poppins(
                        fontSize: 28,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextSpan(
                      text: ' Arun Prakash\n',
                      style: GoogleFonts.poppins(
                        fontSize: 42,
                        color: Colors.blue,
                        fontWeight: FontWeight.w800,
                        shadows: [
                          const BoxShadow(
                            color: Colors.black38,
                            blurRadius: 4,
                            spreadRadius: 3,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                    ),
                    TextSpan(
                      text:
                          'A Software Engineer. I love building things and helping people.',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  HoverIcon(
                    icon: const Icon(
                      AntDesign.mail_outline,
                      size: iconSize,
                    ),
                    hoverIcon: Brand(
                      Brands.gmail,
                      size: iconSize,
                    ),
                    onPressed: () => _launchSocialMediaUrl(
                      'mailto:arun.prakash.456789@gmail.com',
                    ),
                  ),
                  HoverIcon(
                    icon: const Icon(
                      AntDesign.github_outline,
                      size: iconSize,
                    ),
                    hoverIcon: Brand(
                      Brands.github,
                      size: iconSize,
                    ),
                    onPressed: () => _launchSocialMediaUrl(
                      'https://github.com/ArunPrakashG',
                    ),
                  ),
                  HoverIcon(
                    icon: const Icon(
                      AntDesign.linkedin_outline,
                      size: iconSize,
                    ),
                    hoverIcon: Brand(
                      Brands.linkedin,
                      size: iconSize,
                    ),
                    onPressed: () => _launchSocialMediaUrl(
                      'https://www.linkedin.com/in/arunprakashg/',
                    ),
                  ),
                  HoverIcon(
                    icon: const Icon(
                      AntDesign.twitter_outline,
                      size: iconSize,
                    ),
                    hoverIcon: Brand(
                      Brands.twitter,
                      size: iconSize,
                    ),
                    onPressed: () => _launchSocialMediaUrl(
                      'https://twitter.com/_arunprakash_',
                    ),
                  ),
                  HoverIcon(
                    icon: const Icon(
                      AntDesign.facebook_outline,
                      size: iconSize,
                    ),
                    hoverIcon: Brand(
                      Brands.facebook,
                      size: iconSize,
                    ),
                    onPressed: () => _launchSocialMediaUrl(
                      'https://www.facebook.com/arunprakash.i/',
                    ),
                  ),
                  HoverIcon(
                    icon: const Icon(
                      AntDesign.instagram_outline,
                      size: iconSize,
                    ),
                    hoverIcon: Brand(
                      Brands.instagram,
                      size: iconSize,
                    ),
                    onPressed: () => _launchSocialMediaUrl(
                      'https://www.instagram.com/i.arunprakash',
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(width: 32),
          const CircleAvatar(
            radius: 80,
            foregroundImage: AssetImage('assets/images/developer.jpg'),
          ),
        ],
      ),
    );
  }

  void _launchSocialMediaUrl(String url) {
    launchUrl(Uri.parse(url));
  }
}
