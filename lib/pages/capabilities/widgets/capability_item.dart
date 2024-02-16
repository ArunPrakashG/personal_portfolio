import 'package:animate_do/animate_do.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CapabilityItem extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: FadeInUp(
        duration: const Duration(milliseconds: 400),
        delay: Duration(milliseconds: 100 * index),
        child: Container(
          padding: const EdgeInsets.all(4),
          height: 44,
          width: 44,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 4,
                spreadRadius: 2,
              ),
            ],
          ),
          child: SvgPicture.asset('assets/icons/$logo'),
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('logo', logo));
    properties.add(StringProperty('tooltip', tooltip));
    properties.add(IntProperty('index', index));
  }
}
