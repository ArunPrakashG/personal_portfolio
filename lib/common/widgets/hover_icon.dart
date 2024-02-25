import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HoverIcon extends StatefulWidget {
  const HoverIcon({
    required this.icon,
    required this.hoverIcon,
    this.onPressed,
    super.key,
  });

  final Widget icon;
  final Widget hoverIcon;
  final VoidCallback? onPressed;

  @override
  State<HoverIcon> createState() => _HoverIconState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ObjectFlagProperty<VoidCallback?>.has('onTap', onPressed));
  }
}

class _HoverIconState extends State<HoverIcon> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedCrossFade(
        duration: const Duration(milliseconds: 200),
        firstChild: IconButton(
          icon: widget.icon,
          onPressed: widget.onPressed,
          iconSize: 20,
          splashRadius: 22,
        ),
        secondChild: IconButton(
          icon: widget.hoverIcon,
          onPressed: widget.onPressed,
          iconSize: 20,
          splashRadius: 22,
        ),
        crossFadeState:
            isHovered ? CrossFadeState.showSecond : CrossFadeState.showFirst,
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<bool>('isHovered', isHovered));
  }
}
