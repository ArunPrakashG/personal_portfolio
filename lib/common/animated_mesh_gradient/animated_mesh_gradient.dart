import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shaders/flutter_shaders.dart';

import '../../constants.dart';

class AnimatedMeshGradient extends StatefulWidget {
  /// Creates a meshed gradient with provided colors and animates between them.
  const AnimatedMeshGradient({
    required this.colors,
    required this.options,
    super.key,
    this.child,
    this.controller,
    this.seed,
  });

  /// Define 4 colors which will be used to create an animated gradient.
  final List<Color> colors;

  /// Here you can define options to play with the animation / effect.
  final AnimatedMeshGradientOptions options;

  /// Sets a seed for the mesh gradient which gives back a static blended gradient based on the given colors.
  /// This settings stops the animation. Try out different values until you like what you see.
  final double? seed;

  /// Can be used to start / stop the animation manually. Will be ignored if [seed] is set.
  final AnimatedMeshGradientController? controller;

  final Widget? child;

  @override
  State<AnimatedMeshGradient> createState() => _AnimatedMeshGradientState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IterableProperty<Color>('colors', colors));
    properties.add(
      DiagnosticsProperty<AnimatedMeshGradientOptions>('options', options),
    );
    properties.add(DoubleProperty('seed', seed));
    properties.add(
      DiagnosticsProperty<AnimatedMeshGradientController?>(
        'controller',
        controller,
      ),
    );
  }
}

class _AnimatedMeshGradientState extends State<AnimatedMeshGradient> {
  late double _time = widget.seed ?? 0;

  void _timeLoop() {
    if (!mounted ||
        (widget.controller != null
            ? !widget.controller!.isAnimating.value
            : false)) {
      return;
    }

    setState(() {
      _time += 16 / 1000;
    });

    Future.delayed(const Duration(milliseconds: 16), _timeLoop);
  }

  @override
  void initState() {
    if (widget.colors.length != 4) {
      throw Exception(
        'Condition colors.length == 4 is not true. Assign exactly 4 colors.',
      );
    }

    super.initState();

    if (widget.seed != null) {
      return;
    }

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (widget.controller == null) {
        _timeLoop();
      }

      if (widget.controller != null && widget.seed == null) {
        widget.controller!.isAnimating.addListener(() {
          if (widget.controller!.isAnimating.value) {
            _timeLoop();
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ShaderBuilder(
      assetKey: shaderAssetPath,
      (context, shader, child) {
        return CustomPaint(
          painter: AnimatedMeshGradientPainter(
            shader: shader,
            time: _time,
            colors: widget.colors,
            options: widget.options,
          ),
          willChange: true,
          child: child,
        );
      },
      child: widget.child,
    );
  }
}

class AnimatedMeshGradientController {
  /// Use [ValueListenableBuilder] to listen to changes in your widget.
  ValueNotifier isAnimating = ValueNotifier(false);

  void start() {
    isAnimating.value = true;
  }

  void stop() {
    isAnimating.value = false;
  }
}

class AnimatedMeshGradientOptions {
  AnimatedMeshGradientOptions({
    this.frequency = 5,
    this.amplitude = 30,
    this.speed = 2,
  });

  /// Sets the frequency of the gradient.
  final double frequency;

  /// Sets the amplitude of the gradient.
  final double amplitude;

  /// Sets the speed of the animation. This is a factor and is used in the computation, which makes it behave differently based on the other values provided.
  final double speed;
}

class AnimatedMeshGradientPainter extends CustomPainter {
  const AnimatedMeshGradientPainter({
    required this.shader,
    required this.time,
    required this.colors,
    required this.options,
  });

  final FragmentShader shader;
  final double time;
  final List<Color> colors;
  final AnimatedMeshGradientOptions options;

  @override
  void paint(Canvas canvas, Size size) {
    //uSize
    shader.setFloat(0, size.width);
    shader.setFloat(1, size.height);

    //uTime
    shader.setFloat(2, time);

    //values
    shader.setFloat(3, options.frequency);
    shader.setFloat(4, options.amplitude);
    shader.setFloat(5, options.speed);

    //colors
    var i = 6;
    for (final color in colors) {
      shader.setFloat(i, color.red / 255);
      i++;
      shader.setFloat(i, color.green / 255);
      i++;
      shader.setFloat(i, color.blue / 255);
      i++;
    }

    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..shader = shader,
    );
  }

  @override
  bool shouldRepaint(covariant AnimatedMeshGradientPainter oldDelegate) =>
      oldDelegate.time != time ||
      oldDelegate.options != options ||
      oldDelegate.colors != colors;
}
