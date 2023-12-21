import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class CustomShapePainter extends CustomPainter {
  CustomShapePainter({this.gradient, required this.progress});

  ui.Gradient? gradient;
  double progress;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..style = PaintingStyle.fill
      ..shader = gradient
      ..maskFilter = const MaskFilter.blur(BlurStyle.solid, 10)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5
      ..strokeJoin = StrokeJoin.miter
      ..strokeMiterLimit = 5
      ..strokeCap = StrokeCap.round;
    double w = size.width;
    Path p = Path()
      ..moveTo(size.width * 0.5, size.height * 0.02)
      ..relativeLineTo(size.width * 0.3, 0)
      ..relativeConicTo(
          size.width * 0.1, 0, size.width * 0.1, size.width * 0.1, 1)
      ..relativeConicTo(0, w * 0.1, -w * 0.1, w * 0.1, 1)
      ..relativeLineTo(-w * 0.2, 0)
      ..relativeConicTo(-0.05 * w, 0, -0.05 * w, 0.05 * w, 1)
      ..relativeConicTo(0, 0.05 * w, 0.05 * w, 0.05 * w, 1)
      ..relativeLineTo(w * 0.4, 0)
      ..relativeConicTo(0.15 * w, 0, 0.15 * w, 0.15 * w, 1)
      ..relativeConicTo(0, 0.15 * w, -0.15 * w, 0.15 * w, 1)
      ..relativeLineTo(-0.5 * w, 0)
      ..relativeLineTo(-0.5 * w, 0)
      ..relativeConicTo(-0.15 * w, 0, -0.15 * w, -0.15 * w, 1)
      ..relativeConicTo(0, -0.15 * w, 0.15 * w, -0.15 * w, 1)
      ..relativeLineTo(w * 0.4, 0)
      ..relativeConicTo(0.05 * w, 0, 0.05 * w, -0.05 * w, 1)
      ..relativeConicTo(0, -0.05 * w, -0.05 * w, -0.05 * w, 1)
      ..relativeLineTo(-w * 0.2, 0)
      ..relativeConicTo(-w * 0.1, 0, -w * 0.1, -w * 0.1, 1)
      ..relativeConicTo(0, -w * 0.1, w * 0.1, -w * 0.1, 1)
      ..close();
    Path dp = Path();
    double distance = progress * 50;

    for (ui.PathMetric pm in p.computeMetrics()) {
      while (distance < pm.length) {
        dp.addPath(pm.extractPath(distance  , distance + 30 ), Offset.zero);
        distance += 50;
      }
    }
    canvas.drawPath(dp, paint);
  }

  @override
  bool shouldRepaint(CustomShapePainter oldDelegate) {
    return true;
  }
}
