import 'package:flutter/material.dart';

import 'constants.dart';
import 'pages/views/capabilities_view.dart';
import 'pages/views/contact_view.dart';
import 'pages/views/experience_view.dart';
import 'pages/views/home_view.dart';
import 'pages/views/projects_view.dart';

const SPLASH_ROUTE = '/';
const BASE_ROUTE = '/base';

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
  AppView('Capabilities', 1, () => const CapabilitiesView()),
  AppView('Experience', 2, () => const ExperienceView()),
  AppView('Projects', 3, () => const ProjectsView()),
  AppView('Contact', 4, () => const ContactView()),
];
