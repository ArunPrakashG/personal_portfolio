import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HoverButton extends StatefulWidget {
  const HoverButton({
    required this.icon,
    required this.label,
    required this.onPressed,
    super.key,
  });

  final Widget icon;
  final Widget label;
  final VoidCallback onPressed;

  @override
  State<HoverButton> createState() => _HoverButtonState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(ObjectFlagProperty<VoidCallback>.has('onPressed', onPressed));
  }
}

class _HoverButtonState extends State<HoverButton> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFF97068).withOpacity(isHovering ? 0.8 : 0.2),
            blurRadius: 12,
            spreadRadius: 4,
          ),
        ],
      ),
      child: ElevatedButton.icon(
        onPressed: widget.onPressed,
        onHover: (value) {
          setState(() {
            isHovering = value;
          });
        },
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(
            Colors.white,
          ),
          splashFactory: InkRipple.splashFactory,
          surfaceTintColor: MaterialStateProperty.all(Colors.white),
          overlayColor: MaterialStateProperty.all(const Color(0xFFF97068)),
          foregroundColor: MaterialStateProperty.resolveWith(
            (states) {
              if (states.contains(MaterialState.hovered)) {
                return Colors.white;
              }

              return Colors.black;
            },
          ),
          animationDuration: const Duration(milliseconds: 300),
        ),
        icon: widget.icon,
        label: widget.label,
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<bool>('isHovering', isHovering));
  }
}
