import 'package:flutter/material.dart';

import 'constants.dart';
import 'pages/views/about_me_view.dart';
import 'pages/views/education_view.dart';
import 'pages/views/experience_view.dart';
import 'pages/views/home_view.dart';
import 'pages/views/projects_view.dart';

class AppView {
  AppView(
    this.name,
    this.index,
    this.builder,
  ) : key = ValueKey(index);

  final int index;
  final Widget Function() builder;
  final ValueKey<int> key;
  final String name;

  ViewIndex get viewIndex => ViewIndex.values[index];
}

List<AppView> views = [
  AppView('Home', 0, () => const HomeView()),
  AppView('About Me', 1, () => const AboutMeView()),
  AppView('Education', 2, () => const EducationView()),
  AppView('Work Experience', 3, () => const ExperienceView()),
  AppView('Projects', 4, () => const ProjectsView()),
];
