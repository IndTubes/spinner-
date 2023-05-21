import 'package:flutter/material.dart';

class CustomHexagonButton extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {

    Paint paint = Paint()
    ..color = Colors.teal
    ..style= PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
    ..strokeWidth = 2 ;

    Path path = Path() ;

    path.moveTo(size.width/8, 0) ;
    path.lineTo(0, size.height/2);
    path.lineTo(size.width/8, size.height);
    path.lineTo(size.width - (size.width/8), size.height);
    path.lineTo(size.width, size.height/2);
    path.lineTo(size.width -(size.width/8), 0);
    path.close() ;

    canvas.drawPath(path, paint);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {

   return false;
  }



}