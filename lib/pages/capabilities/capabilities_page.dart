import 'package:flutter/material.dart';

import '../../common/widgets/content_tile.dart';
import '../../common/widgets/header.dart';
import 'widgets/capability_item.dart';

class CapabilitiesPage extends StatelessWidget {
  const CapabilitiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      extendBodyBehindAppBar: true,
      appBar: Header(),
      body: Padding(
        padding: EdgeInsets.all(32),
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
              ),
              CapabilityItem(
                logo: 'firebase.svg',
                tooltip: 'Firebase',
              ),
              CapabilityItem(
                logo: 'git.svg',
                tooltip: 'Git',
              ),
              CapabilityItem(
                logo: 'csharp.svg',
                tooltip: 'C#',
              ),
              CapabilityItem(
                logo: 'dart.svg',
                tooltip: 'Dart',
              ),
              CapabilityItem(
                logo: 'xamarin.svg',
                tooltip: 'Xamarin',
              ),
              CapabilityItem(
                logo: 'wordpress.svg',
                tooltip: 'Wordpress',
              ),
              CapabilityItem(
                logo: 'apple.svg',
                tooltip: 'Apple',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
