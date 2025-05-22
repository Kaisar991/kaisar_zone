import 'dart:math';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class AnimatedBackground extends StatelessWidget {
  const AnimatedBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoopAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 2 * pi),
      duration: const Duration(seconds: 20),
      builder: (context, value, child) {
        return CustomPaint(
          painter: _WindPainter(value),
          child: Container(),
        );
      },
    );
  }
}

class _WindPainter extends CustomPainter {
  final double animationValue;
  _WindPainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.05)
      ..strokeWidth = 2;

    final path = Path();
    for (double x = 0; x < size.width; x += 20) {
      final y = size.height / 2 +
          20 * sin(animationValue + x / size.width * 2 * pi);
      path.moveTo(x, y);
      path.lineTo(x + 10, y);
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _WindPainter old) =>
      old.animationValue != animationValue;
}
