import 'package:flutter/material.dart';

import '../../common/widgets/content_tile.dart';
import 'widgets/project_tile.dart';

class ProjectsView extends StatelessWidget {
  const ProjectsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        Positioned.fill(
          child: ContentTile(
            title: 'Projects',
            content:
                "I have worked on a variety of projects, from mobile apps to VR experiences. Most of them are open source and available on my GitHub. I am always looking for new projects to work on, so if you have an idea, let's talk!",
            lottie: 'assets/lottie/projects.json',
            bottom: Column(
              children: [
                ProjectTile(
                  name: 'wordpress_client',
                  index: 1,
                  description:
                      'An elite Dart library meticulously tailored for Wordpress REST API integration. Sculpted from the base, offering a user-friendly experience, and grounded on the robustness of the WordpressCore C# Library.',
                  stack: ['Flutter', 'Dart', 'Wordpress'],
                  sourceAvailable: true,
                  repo: 'https://github.com/ArunPrakashG/wordpress_client',
                ),
                ProjectTile(
                  name: 'BSNL Tracker',
                  index: 2,
                  description:
                      'BSNL Tracker is a free application which helps to know your FTTH usage, bills, bill history, topup history etc with a clean & fast UI.',
                  stack: ['Flutter', 'Dart'],
                  demoUrl:
                      'https://play.google.com/store/apps/details?id=bsnlfibertracker.app',
                ),
                ProjectTile(
                  name: 'MGU Result Checker',
                  index: 3,
                  description:
                      'MGU Result checker simplifys the process of checking MGU exam results into a two step process and automates retry mechanisms if the request fails.',
                  stack: ['Flutter', 'Dart'],
                  unmaintained: true,
                  demoUrl:
                      'https://play.google.com/store/apps/details?id=com.synnetic.resultchecker',
                ),
                ProjectTile(
                  name: 'Luna - Digital Assistant',
                  index: 4,
                  description:
                      'Luna is a digital assistant designed to run on Raspberry Pi which is capable of setting reminders, controlling lights etc (via GPIO) , She can crack jokes, quotes, daily messages etc.',
                  stack: ['C#', '.NET Core', 'Raspberry Pi', 'IoT'],
                  sourceAvailable: true,
                  repo: 'https://github.com/ArunPrakashG/Luna',
                ),
                ProjectTile(
                  name: 'byte_converter',
                  index: 5,
                  description:
                      'Byte Converter is a simple library written in Dart which converts bytes to other units like KB, MB, GB, TB, PB, EB, ZB, etc',
                  stack: ['Dart'],
                  sourceAvailable: true,
                  repo: 'https://github.com/ArunPrakashG/byte_converter',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
