import 'package:flutter/material.dart';

import '../../../../../core/theme/portfolio_theme.dart';

class SolidButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;
  const SolidButton({
    super.key,
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final c = PortfolioTheme.of(context);
    return InkWell(
      onTap: onTap,
      child: Container(
        color: c.ink,
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: TextStyle(
                fontFamily: kMonoFont,
                fontSize: 12.5,
                letterSpacing: 2,
                color: c.onInk,
              ),
            ),
            const SizedBox(width: 12),
            Icon(icon, size: 16, color: c.onInk),
          ],
        ),
      ),
    );
  }
}
