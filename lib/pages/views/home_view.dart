import 'dart:developer';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../common/widgets/hover_button.dart';
import '../../common/widgets/hover_icon.dart';
import 'providers/app_init_provider.dart';
import 'providers/quotes_provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              const CircleAvatar(
                radius: 80,
                foregroundImage: AssetImage('assets/images/developer.jpg'),
              ),
              Positioned.fill(
                child: Consumer(
                  builder: (context, ref, child) {
                    return ref.watch(appInitProvider).maybeWhen(
                      loading: () {
                        return ZoomIn(
                          child: const CircularProgressIndicator(),
                        );
                      },
                      orElse: () {
                        return const SizedBox.shrink();
                      },
                    );
                  },
                ),
              ),
            ],
          ),
          const Text.rich(
            TextSpan(
              text: 'Hey there!\n',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              children: [
                TextSpan(
                  text: "I'm",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextSpan(
                  text: ' Arun Prakash\n',
                  style: TextStyle(
                    fontSize: 42,
                    color: Colors.blue,
                    fontWeight: FontWeight.w800,
                    shadows: [
                      BoxShadow(
                        color: Colors.blueAccent,
                        blurRadius: 8,
                        spreadRadius: 6,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                ),
                TextSpan(
                  text: 'A Senior Software Engineer',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HoverIcon(
                icon: const Icon(AntDesign.github_outline),
                hoverIcon: Brand(Brands.github),
                onPressed: () => _launchSocialMediaUrl(
                  'https://github.com/ArunPrakashG',
                ),
              ),
              HoverIcon(
                icon: const Icon(AntDesign.linkedin_outline),
                hoverIcon: Brand(Brands.linkedin),
                onPressed: () => _launchSocialMediaUrl(
                  'https://www.linkedin.com/in/arunprakashg/',
                ),
              ),
              HoverIcon(
                icon: const Icon(AntDesign.twitter_outline),
                hoverIcon: Brand(Brands.twitter),
                onPressed: () => _launchSocialMediaUrl(
                  'https://twitter.com/_arunprakash_',
                ),
              ),
              HoverIcon(
                icon: const Icon(AntDesign.facebook_outline),
                hoverIcon: Brand(Brands.facebook),
                onPressed: () => _launchSocialMediaUrl(
                  'https://www.facebook.com/arunprakash.i/',
                ),
              ),
              HoverIcon(
                icon: const Icon(AntDesign.instagram_outline),
                hoverIcon: Brand(Brands.instagram),
                onPressed: () => _launchSocialMediaUrl(
                  'https://www.instagram.com/i.arunprakash',
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          HoverButton(
            icon: const Icon(EvaIcons.email),
            label: const Text(
              "Let's Connect!",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            onPressed: _onContactTapped,
          ),
          Consumer(
            builder: (context, ref, child) {
              return ref.watch(quotesProvider).maybeWhen(
                data: (data) {
                  return FadeInUp(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 18,
                        horizontal: 12,
                      ),
                      child: Text.rich(
                        TextSpan(
                          text: '“',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                          ),
                          children: [
                            TextSpan(
                              text: data.content,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const TextSpan(
                              text: '”',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextSpan(
                              text: ' - ${data.author}',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        style: GoogleFonts.arimo(),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                },
                orElse: () {
                  return const SizedBox.shrink();
                },
              );
            },
          ),
        ],
      ),
    );
  }

  void _launchSocialMediaUrl(String url) {
    launchUrl(Uri.parse(url));
  }

  Future<void> _onContactTapped() async {
    final emailLaunchUri = Uri.tryParse('mailto:arun.prakash.456789@gmail.com');

    if (emailLaunchUri == null) {
      return;
    }

    if (!await canLaunchUrl(emailLaunchUri)) {
      log('Could not launch $emailLaunchUri');
      return;
    }

    await launchUrl(emailLaunchUri);
  }
}
