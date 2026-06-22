import 'package:flutter/material.dart';

import '../../../../../core/theme/portfolio_theme.dart';

class OutlineButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const OutlineButton({super.key, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final c = PortfolioTheme.of(context);
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
        decoration: BoxDecoration(border: Border.all(color: c.border)),
        child: Text(
          label,
          style: TextStyle(
            fontFamily: kMonoFont,
            fontSize: 12.5,
            letterSpacing: 2,
            color: c.textPrimary,
          ),
        ),
      ),
    );
  }
}
