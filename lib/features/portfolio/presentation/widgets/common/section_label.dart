import 'package:flutter/material.dart';

import '../../../../../core/theme/portfolio_theme.dart';

class SectionLabel extends StatelessWidget {
  final String text;
  const SectionLabel(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    final c = PortfolioTheme.of(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(width: 8, height: 8, color: c.accent),
        const SizedBox(width: 10),
        Text(
          text,
          style: TextStyle(
            fontFamily: kMonoFont,
            fontSize: 12,
            letterSpacing: 3,
            fontWeight: FontWeight.w600,
            color: c.textSecondary,
          ),
        ),
      ],
    );
  }
}
