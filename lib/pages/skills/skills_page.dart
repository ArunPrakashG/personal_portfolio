import 'package:flutter/material.dart';

class SkillsPage extends StatelessWidget {
  const SkillsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Skills'),
        leading: const BackButton(),
      ),
      body: const Center(
        child: Text('Skills'),
      ),
    );
  }
}
