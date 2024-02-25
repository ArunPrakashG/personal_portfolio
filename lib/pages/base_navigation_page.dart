import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../common/widgets/header.dart';
import '../routes.dart';

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
          PageView.builder(
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
          Positioned(
            right: 16,
            bottom: 16,
            child: Column(
              children: [
                IconButton(
                  icon: const Icon(Icons.update),
                  onPressed: () {
                    pageController.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
              ],
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
