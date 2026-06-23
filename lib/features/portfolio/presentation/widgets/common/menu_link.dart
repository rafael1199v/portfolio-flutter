import 'package:flutter/material.dart';

import '../../../../../core/theme/portfolio_theme.dart';

class MenuLink extends StatelessWidget {
  final String label;
  final bool accent;
  final VoidCallback onTap;
  const MenuLink(this.label, {super.key, this.accent = false, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final c = PortfolioTheme.of(context);
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Text(
          label,
          style: TextStyle(
            fontFamily: kMonoFont,
            fontSize: 16,
            letterSpacing: 2,
            color: accent ? c.accent : c.textSecondary,
          ),
        ),
      ),
    );
  }
}
