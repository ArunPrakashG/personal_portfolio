import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import '../common/widgets/header.dart';
import '../routes.dart';

class BaseNavigationPage extends StatefulWidget {
  const BaseNavigationPage({super.key});

  @override
  State<BaseNavigationPage> createState() => _BaseNavigationPageState();
}

class _BaseNavigationPageState extends State<BaseNavigationPage> {
  final AutoScrollController scrollController = AutoScrollController(
    axis: Axis.vertical,
  );

  @override
  void dispose() {
    super.dispose();

    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        controller: scrollController,
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ...views
                .map(
                  (view) => AutoScrollTag(
                    key: view.key,
                    controller: scrollController,
                    index: view.index,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 52),
                      child: view.builder(),
                    ),
                  ),
                )
                .toList(),
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 4,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFF222E50).withOpacity(0.2),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Made with ❤️ by Arun Prakash using Flutter & Dart',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    'This website is powered by the most recent Flutter build. Please note that Flutter Web is currently in its developmental phase.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                  Text(
                    'This project primarily serves as an exploration into optimizing Flutter web applications. As such, occasional crashes and bugs may occur.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<AutoScrollController>(
        'scrollController',
        scrollController,
      ),
    );
  }
}
