import 'package:flutter/material.dart';

import '../../common/widgets/content_tile.dart';
import '../../common/widgets/header.dart';
import 'widgets/experience_tile.dart';

class ExperiencePage extends StatelessWidget {
  const ExperiencePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: Header(),
      backgroundColor: Color(0xFFF8F8FF),
      body: Stack(
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
                      'Dart',
                      'Flutter',
                      'Xamarin.Forms',
                      'React Native',
                    ],
                    description:
                        'Worked on various projects and scripts and learned new languages and frameworks. Developed various other libraries in different languages.',
                  ),
                  ExperianceTile(
                    companyName: 'White Rabbit Group',
                    role: 'Software Engineer',
                    date: '2021 - 2023',
                    index: 2,
                    learnedItems: [
                      'Java',
                      'Kotlin',
                      'Swift',
                      'Objective-C',
                    ],
                    description:
                        'I worked on the Facebook app for Android and iOS. I worked on a variety of features, including news feed, notifications, and messaging. I also worked on the Facebook API, which allows developers to integrate Facebook into their own apps.',
                  ),
                  ExperianceTile(
                    companyName: 'Freelance',
                    role: 'Software Developer',
                    date: '2018 - 2021',
                    index: 3,
                    learnedItems: [
                      'C#',
                      'XAML',
                      'UWP',
                      'WPF',
                    ],
                    description:
                        'I worked on the Windows Phone team, where I helped build and maintain the Windows Phone app for Windows Phone 7 and Windows Phone 8. I worked on a variety of features, including the start screen, the app list, and the settings app.',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
