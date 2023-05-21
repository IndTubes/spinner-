
import 'package:flutter/material.dart';
import 'dart:ui' as ui ;


class CustomHalfCircle extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {

    Paint paint = Paint()
    ..color = Colors.red
      ..shader = ui.Gradient.linear(
          Offset(0,0),
          Offset(size.width , size.height),
          [
            Color(0xFF00FFE1),
            Color(0xFF006262),
          ])

    ..style = PaintingStyle.fill ;

    Path path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(size.width *.50, 80, size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);


    canvas.drawPath(path, paint);





  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

}