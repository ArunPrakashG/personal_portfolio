import 'package:flutter/material.dart';

import '../../common/widgets/content_tile.dart';
import 'widgets/capability_item.dart';

class CapabilitiesView extends StatelessWidget {
  const CapabilitiesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        Positioned.fill(
          child: ContentTile(
            title: 'Capabilities',
            content:
                'Innovative programmer with a passion for problem-solving and creativity. Dedicated to excellence, I view programming as an art form and thrive on challenges. Specializing in tackling complex problems, I aim to exceed expectations with every project.',
            lottie: 'assets/lottie/capabilities.json',
            bottom: Wrap(
              spacing: 8,
              runSpacing: 6,
              children: [
                CapabilityItem(
                  logo: 'flutter.svg',
                  tooltip: 'Flutter',
                  index: 0,
                ),
                CapabilityItem(
                  logo: 'firebase.svg',
                  tooltip: 'Firebase',
                  index: 1,
                ),
                CapabilityItem(
                  logo: 'git.svg',
                  tooltip: 'Git',
                  index: 2,
                ),
                CapabilityItem(
                  logo: 'csharp.svg',
                  tooltip: 'C#',
                  index: 3,
                ),
                CapabilityItem(
                  logo: 'dart.svg',
                  tooltip: 'Dart',
                  index: 4,
                ),
                CapabilityItem(
                  logo: 'xamarin.svg',
                  tooltip: 'Xamarin',
                  index: 5,
                ),
                CapabilityItem(
                  logo: 'wordpress.svg',
                  tooltip: 'Wordpress',
                  index: 6,
                ),
                CapabilityItem(
                  logo: 'apple.svg',
                  tooltip: 'Apple',
                  index: 7,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
