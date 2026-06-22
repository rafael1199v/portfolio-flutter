import 'package:flutter/material.dart';

import '../../../../../core/theme/portfolio_theme.dart';

class NavItem extends StatelessWidget {
  final String label;
  final bool active;
  final VoidCallback onTap;
  const NavItem(this.label, {super.key, this.active = false, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final c = PortfolioTheme.of(context);
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: TextStyle(
              fontFamily: kMonoFont,
              fontSize: 12,
              letterSpacing: 1.5,
              color: active ? c.textPrimary : c.textSecondary,
            ),
          ),
          const SizedBox(height: 3),
          Container(
            height: 1.5,
            width: active ? 22 : 0,
            color: c.accent,
          ),
        ],
      ),
    );
  }
}
