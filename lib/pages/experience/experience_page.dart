import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

import '../../common/widgets/content_tile.dart';
import '../../common/widgets/header.dart';

class ExperiencePage extends StatelessWidget {
  const ExperiencePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const Header(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: ContentTile(
            title: 'Experience',
            content:
                'I have been working as a software developer for over 10 years. I have experience in a wide range of technologies and have worked on a variety of projects. I have worked on mobile apps, web apps, and desktop apps. I have also worked on a variety of projects, including e-commerce, social media, and enterprise software.',
            lottie: 'assets/lottie/experience.json',
            bottom: Timeline.tileBuilder(
              shrinkWrap: true,
              builder: TimelineTileBuilder.fromStyle(
                contentsAlign: ContentsAlign.alternating,
                contentsBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(24),
                  child: Text('Timeline Event $index'),
                ),
                itemCount: 3,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
