import 'package:flutter/material.dart';

import '../../../../../core/theme/portfolio_theme.dart';

class ThemeToggle extends StatelessWidget {
  final bool isDark;
  final VoidCallback onTap;
  const ThemeToggle({super.key, required this.isDark, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final c = PortfolioTheme.of(context);
    return InkWell(
      onTap: onTap,
      child: Icon(
        isDark ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
        size: 16,
        color: c.textSecondary,
      ),
    );
  }
}
