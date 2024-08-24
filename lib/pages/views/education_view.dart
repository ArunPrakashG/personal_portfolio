import 'package:flutter/material.dart';

import '../../common/widgets/content_view.dart';
import '../../common/widgets/education_item.dart';

class EducationView extends StatelessWidget {
  const EducationView({super.key});

  @override
  Widget build(BuildContext context) {
    return const ContentView(
      title: 'Education',
      content: '',
      lottie: 'assets/images/capabilities.png',
      bottom: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 8,
        ),
        child: Wrap(
          spacing: 8,
          runSpacing: 6,
          children: [
            EducationItem(
              location: 'St. Thomas College, Thavalapara',
              date: '2018 - 2021',
              course: 'Bachelor of Computer Applications',
            ),
            EducationItem(
              location: 'Mount Bethany H.S.S, Mylapra',
              date: '2016 - 2018',
              course: 'Higher Secondary Education',
            ),
            EducationItem(
              location: 'Holy Angels Model School, Vettipuram',
              date: '2013 - 2015',
              course: 'Secondary Education',
            ),
          ],
        ),
      ),
    );
  }
}
