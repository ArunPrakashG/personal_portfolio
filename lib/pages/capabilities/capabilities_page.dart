import 'package:flutter/material.dart';

import '../../common/widgets/header.dart';

class SkillsPage extends StatelessWidget {
  const SkillsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      extendBodyBehindAppBar: true,
      appBar: Header(),
      body: Center(
        child: Text('Skills'),
      ),
    );
  }
}
