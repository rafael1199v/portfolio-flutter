import 'package:flutter/material.dart';

import '../../../../core/theme/portfolio_theme.dart';

class DottedBackground extends StatelessWidget {
  final Widget child;
  const DottedBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final c = PortfolioTheme.of(context);
    return CustomPaint(
      painter: _DotPainter(c.dot),
      child: child,
    );
  }
}

class _DotPainter extends CustomPainter {
  static const double _gap = 26;
  static const double _radius = 1.1;

  final Color color;
  _DotPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    for (double y = 0; y < size.height; y += _gap) {
      for (double x = 0; x < size.width; x += _gap) {
        canvas.drawCircle(Offset(x, y), _radius, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant _DotPainter oldDelegate) =>
      oldDelegate.color != color;
}
