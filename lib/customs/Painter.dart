import 'package:flutter/material.dart';

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Color(0xfffc4572);
    canvas.drawRRect(
      RRect.fromRectAndRadius(Rect.fromLTWH(2, 2, 18, 60), Radius.circular(0)),
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
