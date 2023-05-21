
import 'dart:math' ;

import 'package:flutter/material.dart';


class CustomTracker extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {


    Paint paint =Paint()
    ..color= Colors.black.withOpacity(0.3)
    ..strokeWidth =5
    ..style = PaintingStyle.stroke ;
    var center = Offset(size.width/2, size.height/2);


    Paint paint1 =Paint()
      ..color= Colors.yellow
      ..strokeWidth =5
      ..style = PaintingStyle.stroke ;
    
    canvas.drawCircle(center, 35, paint) ;



    canvas.drawArc(
        Rect.fromCircle(center: center, radius: 35),
        0, 2*pi*(30/100),  false, paint1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {

   return false;
  }

}