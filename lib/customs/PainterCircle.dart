import 'package:flutter/material.dart';

class CurvePainterCircle extends CustomPainter {
  final Color color;
  const CurvePainterCircle({this.color});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = color;

    canvas.drawCircle(Offset(270, -50), 340, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
