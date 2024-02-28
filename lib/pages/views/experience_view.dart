import 'package:flutter/material.dart';

import '../../common/widgets/content_tile.dart';
import '../../constants.dart';
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
            content: myExperience,
            lottie: 'assets/images/experience.png',
            bottom: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ExperianceTile(
                  companyName: 'White Rabbit Group',
                  role: 'Senior Software Engineer',
                  date: '2023 - Present',
                  index: 1,
                  learnedItems: [
                    'Worked on custom bootstrapper CLI internal tool, which helped simplify various repetitive tasks and boosted productivity.',
                    'Developed Oculus Quest and Pico G4 VR applications using Unity',
                    'Had the opportunity to work on Go - Echo based backend project.',
                    'Earned App Development with Swift - Certified User Certificate from Apple Inc.',
                  ],
                  description: '',
                ),
                ExperianceTile(
                  companyName: 'White Rabbit Group',
                  role: 'Software Engineer',
                  date: '2021 - 2023',
                  index: 2,
                  learnedItems: [
                    'Worked on a variety of projects including mobile, web, and VR applications.',
                    'Worked on variety of internal tools for time tracking and bug report generation which assisted various teams to work efficiently.',
                    'Developed Oculus Quest and Pico G4 VR applications using Unity',
                    'Earned App Development with Swift - Associate from Apple Inc.',
                  ],
                  description: '',
                ),
                ExperianceTile(
                  companyName: 'Freelance',
                  role: 'Software Developer',
                  date: '2018 - 2021',
                  index: 3,
                  learnedItems: [
                    'Worked on a variety of projects, including mobile and web applications.',
                    'Designed, Developed and Published a library to interact with Wordpress REST API for Flutter and Dart, which is currently being used in production by different teams.',
                    'Designed and Developed a Mobile application to simplify BSNL Fiber consumed data tracking, which is downloaded and being used by more than 10,000 users in India.',
                    'Designed and Developed a Mobile application to simplify College Result Tracking for students, which was downloaded by over 50,000 students in India and used concurrently by over 25,000 students in India.',
                    'Developed and Published various Nuget packages for Xamarin.Forms and .NET Core which, combined, have over 16,000 downloads so far.',
                    'Developed an Home Automation project using Raspberry Pi 3B+ and .NET Core, which helped turning lights on and off, waking up with music, reading out received notifications etc.',
                  ],
                  description:
                      'My Freelance journey has been nothing but marvelous, I was able to learn and grow myself with the exposure to different technologies and projects. Other than developing production ready applications, I also had the opportunity to work on various libraries and packages which are currently being used in production by different teams.',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
