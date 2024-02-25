import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../common/widgets/hover_button.dart';
import '../../common/widgets/hover_icon.dart';
import 'providers/app_init_provider.dart';
import 'providers/image_size_provider.dart';
import 'providers/quotes_provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final devImage = Image.asset(
      'assets/images/developer.jpg',
      fit: BoxFit.cover,
      filterQuality: FilterQuality.high,
      isAntiAlias: true,
    );

    return Stack(
      children: [
        Positioned(
          left: 12,
          top: 12,
          height: 80,
          child: Consumer(
            builder: (context, ref, child) {
              return ref.watch(appInitProvider).maybeWhen(
                loading: () {
                  return FadeInLeft(
                    child: Material(
                      borderRadius: BorderRadius.circular(12),
                      child: const Padding(
                        padding: EdgeInsets.all(12),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              width: 16,
                              height: 16,
                              child: CircularProgressIndicator(),
                            ),
                            SizedBox(width: 12),
                            Text(
                              'Caching assets...',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
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
        ),
        Positioned(
          top: 0,
          right: 0,
          bottom: 0,
          child: Consumer(
            builder: (context, ref, child) {
              final imageSize = ref.watch(imageSizeProvider(devImage));

              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                child: imageSize.maybeWhen(
                  data: (size) {
                    return Container(
                      transform: Matrix4.translationValues(
                        _getImageTranslationValue(context, size),
                        0,
                        0,
                      ),
                      foregroundDecoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFF001524),
                            Colors.transparent,
                          ],
                        ),
                        border: Border.fromBorderSide(
                          BorderSide.none,
                        ),
                      ),
                      child: devImage,
                    );
                  },
                  orElse: () => const SizedBox.shrink(),
                ),
              );
            },
          ),
        ),
        Positioned.fill(
          top: 24,
          left: 24,
          right: 24,
          bottom: 24,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                    onPressed: () {},
                  ),
                  HoverIcon(
                    icon: const Icon(AntDesign.linkedin_outline),
                    hoverIcon: Brand(Brands.linkedin),
                    onPressed: () {},
                  ),
                  HoverIcon(
                    icon: const Icon(AntDesign.twitter_outline),
                    hoverIcon: Brand(Brands.twitter),
                    onPressed: () {},
                  ),
                  HoverIcon(
                    icon: const Icon(AntDesign.facebook_outline),
                    hoverIcon: Brand(Brands.facebook),
                    onPressed: () {},
                  ),
                  HoverIcon(
                    icon: const Icon(AntDesign.instagram_outline),
                    hoverIcon: Brand(Brands.instagram),
                    onPressed: () {},
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
                onPressed: () {},
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
        ),
      ],
    );
  }

  double _getImageTranslationValue(BuildContext context, ImageSize size) {
    final imageHalf = size.width / 2.1;
    final screenHeight = MediaQuery.sizeOf(context).height;
    final variation = () {
      if (screenHeight < 600) {
        return (600 - screenHeight).clamp(1, 50);
      } else {
        return 0;
      }
    }();

    return imageHalf * (screenHeight / (size.height + variation));
  }
}
