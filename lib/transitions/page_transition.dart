import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class _PageTransitionController {
  Key pageKey = const ValueKey('page_transition');

  final Duration scaleAnimationDuration = const Duration(milliseconds: 250);
  AnimationController? scaleAnimationController;
  Animation<double>? scaleAnimation;

  void initializeAnimationController({required TickerProvider vsync}) {
    scaleAnimationController = AnimationController(
      vsync: vsync,
      duration: scaleAnimationDuration,
    );

    // ignore: prefer_int_literals
    scaleAnimation = Tween(begin: 1.0, end: 0.75).animate(
      CurvedAnimation(
        parent: scaleAnimationController!.view,
        curve: Curves.easeInExpo,
      ),
    );
  }

  void animateScaleTransition<T>({
    required BuildContext context,
    required Widget Function() builder,
  }) {
    scaleAnimationController!.forward().then(
      (value) {
        scaleAnimationController!.reverse();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => builder(),
          ),
        );
      },
    );
  }
}

class PageTransitionButton extends StatefulWidget {
  const PageTransitionButton({
    required this.child,
    required this.routeBuilder,
    Key? key,
  }) : super(key: key);

  /// Child property. Pass your button here.
  final Widget child;

  /// Pass the widget of the next screen where you want to navigate the user.
  final Widget Function() routeBuilder;

  @override
  State<PageTransitionButton> createState() => _PageTransitionButtonState();
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      ObjectFlagProperty<Widget Function()>.has(
        'routeBuilder',
        routeBuilder,
      ),
    );
  }
}

class _PageTransitionButtonState extends State<PageTransitionButton>
    with SingleTickerProviderStateMixin {
  final _PageTransitionController _homeScreenController =
      _PageTransitionController();

  @override
  void initState() {
    super.initState();
    _homeScreenController.initializeAnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _homeScreenController.scaleAnimationController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _homeScreenController.scaleAnimation!,
      child: Hero(
        tag: _homeScreenController.pageKey,
        child: GestureDetector(
          onTap: () => _homeScreenController.animateScaleTransition(
            context: context,
            builder: widget.routeBuilder,
          ),
          child: widget.child,
        ),
      ),
    );
  }
}

class PageTransitionReceiver extends StatelessWidget {
  PageTransitionReceiver({required this.scaffold, Key? key}) : super(key: key);

  /// Provide scaffold of the destination screen
  final Scaffold scaffold;

  final _PageTransitionController _pageTransitionController =
      _PageTransitionController();

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: _pageTransitionController.pageKey,
      child: scaffold,
    );
  }
}
