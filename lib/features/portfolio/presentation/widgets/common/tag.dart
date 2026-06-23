import 'package:flutter/material.dart';

import '../../../../../core/theme/portfolio_theme.dart';

class Tag extends StatelessWidget {
  final String label;
  const Tag(this.label, {super.key});

  @override
  Widget build(BuildContext context) {
    final c = PortfolioTheme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(border: Border.all(color: c.border)),
      child: Text(
        label,
        style: TextStyle(
          fontFamily: kMonoFont,
          fontSize: 10,
          letterSpacing: 0.5,
          color: c.textSecondary,
        ),
      ),
    );
  }
}
