import 'package:flutter/material.dart';

class CurvePainterGrey extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Color(0xFFf5f6fa);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
          Rect.fromLTWH(10, 35, 85, 12), Radius.circular(0.3)),
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
