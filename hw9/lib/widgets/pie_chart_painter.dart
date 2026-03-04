import 'package:flutter/material.dart';

class PieChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 3;

    final paint = Paint()..style = PaintingStyle.fill;

    final colors = [
      const Color(0xFF27AE60),
      const Color(0xFF4A90E2),
      const Color(0xFFFFA500),
      const Color(0xFF9C27B0),
    ];

    double startAngle = 0;
    final sliceAngle = (2 * 3.141592653589793) / 4; // 90 degrees each

    for (int i = 0; i < 4; i++) {
      paint.color = colors[i];
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        sliceAngle,
        true,
        paint,
      );
      startAngle += sliceAngle;
    }
  }

  @override
  bool shouldRepaint(PieChartPainter oldDelegate) => false;
}
