import 'package:animate_do/animate_do.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:preload_page_view/preload_page_view.dart';

import '../common/widgets/header.dart';
import '../routes.dart';
import 'views/widgets/page_navigation_arrows.dart';

class BaseNavigationPage extends StatefulWidget {
  const BaseNavigationPage({super.key});

  @override
  State<BaseNavigationPage> createState() => _BaseNavigationPageState();
}

class _BaseNavigationPageState extends State<BaseNavigationPage> {
  final pageController = PreloadPageController();
  bool displayFooter = true;

  @override
  void initState() {
    super.initState();

    pageController.addListener(_shouldDisplayFooter);
  }

  void _shouldDisplayFooter() {
    if (pageController.page == 0 || pageController.page == null) {
      setState(() {
        displayFooter = true;
      });
    } else {
      setState(() {
        displayFooter = false;
      });
    }
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
            child: PreloadPageView.builder(
              scrollDirection: Axis.vertical,
              controller: pageController,
              itemCount: views.length,
              pageSnapping: false,
              preloadPagesCount: 3,
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
            bottom: 44,
            child: PageNavigationArrows(
              controller: pageController,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Visibility(
              visible: displayFooter,
              child: FadeInUp(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 4,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF222E50).withOpacity(0.2),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Made with ❤️ by Arun Prakash using Flutter & Dart',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
      DiagnosticsProperty<PreloadPageController>(
        'pageController',
        pageController,
      ),
    );
    properties.add(DiagnosticsProperty<bool>('displayFooter', displayFooter));
  }
}
