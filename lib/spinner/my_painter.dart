import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dart:math' as math;
/*class MyPainter extends CustomPainter {
  final List<int> values;
  final List<Color> colors;
  final double currentAngle;

  MyPainter({
    required this.values,
    required this.colors,
    required this.currentAngle,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double radius = size.width / 2;
    final double centerX = size.width / 2;
    final double centerY = size.height / 2;

    final Paint paint = Paint();

    double angle = 0;

    for (int i = 0; i < values.length; i++) {
      angle = i * pi / 2;

      paint.color = colors[i];
      canvas.drawArc(
        Rect.fromCircle(center: Offset(centerX, centerY), radius: radius),
        angle - pi / 4,
        pi / 2,
        true,
        paint,
      );

      TextSpan span = TextSpan(
        style: TextStyle(
          color: Colors.black,
          fontSize: 25.0,
        ),
        text: values[i].toString(),
      );

      TextPainter tp = TextPainter(
        text: span,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      );

      tp.layout();
      double textWidth = tp.width;
      double textHeight = tp.height;

      double dx = centerX + radius * cos(angle);
      double dy = centerY + radius * sin(angle);

      canvas.save();
      canvas.translate(dx, dy);
      canvas.rotate(angle - pi / 4);
      canvas.translate(-textWidth / 0.5, -textHeight / .5);
      tp.paint(canvas, Offset.zero);
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(MyPainter oldDelegate) {
    return oldDelegate.currentAngle != currentAngle;
  }
}*/


