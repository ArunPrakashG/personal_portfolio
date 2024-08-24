import 'package:flutter/material.dart';

import '../../common/widgets/content_view.dart';
import '../../constants.dart';
import 'widgets/experience_tile.dart';

class ExperienceView extends StatelessWidget {
  const ExperienceView({super.key});

  @override
  Widget build(BuildContext context) {
    return const ContentView(
      title: 'Work Experience',
      content: myExperience,
      lottie: 'assets/images/experience.png',
      bottom: Column(
        children: [
          ExperianceTile(
            companyName: 'White Rabbit Group',
            role: 'Senior Software Engineer',
            date: '2023 - Present',
            index: 1,
            learnedItems: [],
            description:
                'I gained experience in mobile, web, and VR development, including creating internal tools to improve team workflows. I developed VR applications for Oculus Quest and Pico G4 using Unity, and enhanced my iOS development skills through the App Development with Swift - Associate certification from Apple Inc.',
          ),
          ExperianceTile(
            companyName: 'White Rabbit Group',
            role: 'Software Engineer',
            date: '2021 - 2023',
            index: 2,
            learnedItems: [],
            description:
                'Worked on mobile, web, and VR projects, including developing internal tools for time tracking and bug reporting to enhance team efficiency. Developed VR applications for Oculus Quest and Pico G4 using Unity. Earned the App Development with Swift - Associate certification from Apple Inc.',
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
    );
  }
}
