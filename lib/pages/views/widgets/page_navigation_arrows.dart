import 'package:animate_do/animate_do.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:preload_page_view/preload_page_view.dart';

import '../../../routes.dart';

class PageNavigationArrows extends StatefulWidget {
  const PageNavigationArrows({
    required this.controller,
    super.key,
  });

  final PreloadPageController controller;

  @override
  State<PageNavigationArrows> createState() => _PageNavigationArrowsState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<PreloadPageController>('controller', controller),
    );
  }
}

class _PageNavigationArrowsState extends State<PageNavigationArrows> {
  bool hideUpArrow = false;
  bool hideDownArrow = false;

  @override
  void initState() {
    super.initState();

    _setButtonVisibilityState();
    widget.controller.addListener(_setButtonVisibilityState);
  }

  void _setButtonVisibilityState() {
    final currentPage = widget.controller.page;
    final isFirstPage = views.first.index == currentPage || currentPage == null;
    final isLastPage = views.last.index == currentPage;

    if (!isFirstPage && !isLastPage) {
      if (hideUpArrow || hideDownArrow) {
        setState(() {
          hideUpArrow = false;
          hideDownArrow = false;
        });
      }

      return;
    }

    if (isFirstPage && !hideUpArrow) {
      setState(() {
        hideUpArrow = true;
      });

      return;
    }

    if (isLastPage && !hideDownArrow) {
      setState(() {
        hideDownArrow = true;
      });

      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (hideUpArrow && hideDownArrow) {
      return const SizedBox.shrink();
    }

    return Column(
      children: [
        Visibility(
          visible: !hideUpArrow,
          replacement: const SizedBox(
            height: 54,
            width: 54,
          ),
          child: FadeInRight(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: 54,
              width: 54,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFF212738),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFF97068).withOpacity(0.3),
                    blurRadius: 6,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: IconButton(
                icon: const Icon(BoxIcons.bx_arrow_to_top),
                onPressed: () {
                  widget.controller.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        Visibility(
          visible: !hideDownArrow,
          replacement: const SizedBox(
            height: 54,
            width: 54,
          ),
          child: FadeInRight(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: 54,
              width: 54,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFF212738),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFF97068).withOpacity(0.3),
                    blurRadius: 12,
                    spreadRadius: 4,
                  ),
                ],
              ),
              child: IconButton(
                icon: const Icon(BoxIcons.bx_arrow_to_bottom),
                onPressed: () {
                  widget.controller.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<bool>('hideUpArrow', hideUpArrow));
    properties.add(DiagnosticsProperty<bool>('hideDownArrow', hideDownArrow));
  }
}
