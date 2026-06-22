import 'package:flutter/material.dart';

import '../../../../../core/theme/portfolio_theme.dart';

class SectionHeading extends StatelessWidget {
  final String text;
  final double fontSize;
  const SectionHeading(this.text, {super.key, this.fontSize = 38});

  @override
  Widget build(BuildContext context) {
    final c = PortfolioTheme.of(context);
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w900,
        letterSpacing: -0.5,
        color: c.textPrimary,
      ),
    );
  }
}
