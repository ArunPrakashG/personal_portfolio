import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../common/widgets/header.dart';
import '../routes.dart';
import 'views/widgets/page_navigation_arrows.dart';

class BaseNavigationPage extends StatefulWidget {
  const BaseNavigationPage({super.key});

  @override
  State<BaseNavigationPage> createState() => _BaseNavigationPageState();
}

class _BaseNavigationPageState extends State<BaseNavigationPage> {
  final pageController = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();

    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF001524),
      appBar: Header(
        controller: pageController,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: PageView.builder(
              scrollDirection: Axis.vertical,
              controller: pageController,
              itemCount: views.length,
              scrollBehavior: const CupertinoScrollBehavior(),
              findChildIndexCallback: (key) {
                return views.indexWhere((view) => view.key == key);
              },
              itemBuilder: (context, index) {
                return KeyedSubtree(
                  key: views[index].key,
                  child: views[index].builder(),
                );
              },
            ),
          ),
          Positioned(
            right: 18,
            bottom: 18,
            child: PageNavigationArrows(
              controller: pageController,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<PageController>('pageController', pageController),
    );
  }
}
