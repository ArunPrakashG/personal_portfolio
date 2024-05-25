import 'package:flutter/material.dart';

import '../../common/widgets/content_view.dart';
import 'widgets/capability_item.dart';

class CapabilitiesView extends StatelessWidget {
  const CapabilitiesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const ContentView(
      title: 'Capabilities',
      content:
          'Innovative engineer with a passion for problem-solving and creativity. Dedicated to excellence, I view programming as an art form and thrive on challenges. Specializing in tackling complex problems, I aim to exceed expectations with every project.',
      lottie: 'assets/images/capabilities.png',
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
            logo: 'unity.svg',
            tooltip: 'Unity VR',
            index: 1,
          ),
          CapabilityItem(
            logo: 'oculus.svg',
            tooltip: 'Oculus Quest',
            index: 2,
          ),
          CapabilityItem(
            logo: 'csharp.svg',
            tooltip: '.NET Core',
            index: 3,
          ),
          CapabilityItem(
            logo: 'xamarin.svg',
            tooltip: 'Xamarin',
            index: 4,
          ),
          CapabilityItem(
            logo: 'wordpress.svg',
            tooltip: 'Wordpress',
            index: 5,
          ),
          CapabilityItem(
            logo: 'swiftui.svg',
            tooltip: 'SwiftUI',
            index: 6,
          ),
          CapabilityItem(
            logo: 'firebase.svg',
            tooltip: 'Firebase',
            index: 7,
          ),
          CapabilityItem(
            logo: 'git.svg',
            tooltip: 'Git',
            index: 8,
          ),
          CapabilityItem(
            logo: 'dart.svg',
            tooltip: 'Dart',
            index: 9,
          ),
        ],
      ),
    );
  }
}
