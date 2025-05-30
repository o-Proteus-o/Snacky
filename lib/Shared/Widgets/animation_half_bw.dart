import 'package:flutter/material.dart';

class AnimatedHalfBWBorder extends StatelessWidget {
  final double progress; // 0.0 to 1.0
  final Widget child;
  const AnimatedHalfBWBorder({
    super.key,
    required this.progress,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _HalfBWBorderPainter(progress: progress),
      child: child,
    );
  }
}

class _HalfBWBorderPainter extends CustomPainter {
  final double progress;
  _HalfBWBorderPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final strokeWidth = 3.0;
    // final radius = BorderRadius.circular(10);

    // Create a sweep gradient: half black, half white
    final gradient = SweepGradient(
      startAngle: progress * 2 * 3.1415926,
      endAngle: progress * 3.1415926 + 3.1415926,
      colors: [
        Colors.black,
        Colors.white,
        Colors.white,
        Colors.white,
        Colors.black,
      ],
      stops: [0.0, 0.5, 0.5, 1.0, 1.0],
      tileMode: TileMode.decal,
    );

    final paint =
        Paint()
          ..shader = gradient.createShader(rect)
          ..style = PaintingStyle.stroke
          ..strokeWidth = strokeWidth;

    final rrect = RRect.fromRectAndRadius(
      rect.deflate(strokeWidth / 2),
      Radius.circular(18),
    );
    canvas.drawRRect(rrect, paint);
  }

  @override
  bool shouldRepaint(_HalfBWBorderPainter oldDelegate) =>
      oldDelegate.progress != progress;
}
