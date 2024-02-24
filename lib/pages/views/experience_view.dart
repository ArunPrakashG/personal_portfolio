import 'package:flutter/material.dart';

import '../../common/widgets/content_tile.dart';
import 'widgets/experience_tile.dart';

class ExperienceView extends StatelessWidget {
  const ExperienceView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        Positioned.fill(
          child: ContentTile(
            title: 'Experience',
            content:
                'I have been working as a software developer for over 10 years. I have experience in a wide range of technologies and have worked on a variety of projects. I have worked on mobile apps, web apps, and desktop apps. I have also worked on a variety of projects, including e-commerce, social media, and enterprise software.',
            lottie: 'assets/lottie/experience.json',
            bottom: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ExperianceTile(
                  companyName: 'White Rabbit Group',
                  role: 'Senior Software Engineer',
                  date: '2023 - Present',
                  index: 1,
                  learnedItems: [
                    'Flutter',
                    '.NET',
                    'Go',
                    'React Native',
                    'Unity',
                    'Oculus VR',
                  ],
                  description: '',
                ),
                ExperianceTile(
                  companyName: 'White Rabbit Group',
                  role: 'Software Engineer',
                  date: '2021 - 2023',
                  index: 2,
                  learnedItems: [
                    'Flutter',
                    'Go',
                    'Swift UI',
                    'React Native',
                    'Unity',
                  ],
                  description: '',
                ),
                ExperianceTile(
                  companyName: 'Freelance',
                  role: 'Software Developer',
                  date: '2018 - 2021',
                  index: 3,
                  learnedItems: [
                    'Flutter',
                    'C#',
                    'XAML',
                    'UWP',
                    'WPF',
                  ],
                  description: '',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
