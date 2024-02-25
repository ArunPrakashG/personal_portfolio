import 'package:animate_do/animate_do.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CapabilityItem extends StatefulWidget {
  const CapabilityItem({
    required this.logo,
    required this.tooltip,
    required this.index,
    super.key,
  });

  final String logo;
  final String tooltip;
  final int index;

  @override
  State<CapabilityItem> createState() => _CapabilityItemState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('logo', logo));
    properties.add(StringProperty('tooltip', tooltip));
    properties.add(IntProperty('index', index));
  }
}

class _CapabilityItemState extends State<CapabilityItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      duration: const Duration(milliseconds: 300),
      delay: Duration(milliseconds: widget.index * 400),
      child: MouseRegion(
        onEnter: (_) => setState(() => isHovered = true),
        onExit: (_) => setState(() => isHovered = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 4,
          ),
          transform: isHovered
              ? Matrix4.translationValues(0, -6, 0)
              : Matrix4.translationValues(0, 0, 0),
          decoration: BoxDecoration(
            color: const Color(0xFFEDF2EF),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 4,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: SvgPicture.asset(
                    'assets/icons/${widget.logo}',
                    height: 16,
                  ),
                ),
              ),
              const SizedBox(width: 4),
              Text(
                widget.tooltip,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('logo', widget.logo));
    properties.add(StringProperty('tooltip', widget.tooltip));
    properties.add(IntProperty('index', widget.index));
    properties.add(DiagnosticsProperty<bool>('isHovered', isHovered));
  }
}
