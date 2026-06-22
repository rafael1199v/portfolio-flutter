import 'package:flutter/material.dart';

import '../../../../core/theme/portfolio_theme.dart';
import 'common/nav_item.dart';
import 'common/theme_toggle.dart';

class TopBar extends StatelessWidget {
  final bool isWide;
  final bool isDark;
  final VoidCallback onToggleTheme;
  final VoidCallback onProfile;
  final VoidCallback onProjects;
  final VoidCallback onCareer;
  final VoidCallback onContact;
  final VoidCallback onMenu;

  const TopBar({
    super.key,
    required this.isWide,
    required this.isDark,
    required this.onToggleTheme,
    required this.onProfile,
    required this.onProjects,
    required this.onCareer,
    required this.onContact,
    required this.onMenu,
  });

  @override
  Widget build(BuildContext context) {
    final c = PortfolioTheme.of(context);
    return Row(
      children: [
        Text(
          'RAVM',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w900,
            letterSpacing: 1,
            color: c.textPrimary,
          ),
        ),
        const Spacer(),
        if (isWide)
          Wrap(
            spacing: 22,
            runSpacing: 8,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              NavItem('PERFIL', active: true, onTap: onProfile),
              NavItem('PROYECTOS', onTap: onProjects),
              NavItem('EXPERIENCIA', onTap: onCareer),
              NavItem('CONTACTO', onTap: onContact),
              ThemeToggle(isDark: isDark, onTap: onToggleTheme),
            ],
          )
        else
          IconButton(
            onPressed: onMenu,
            icon: const Icon(Icons.menu, size: 24),
            color: c.textPrimary,
            tooltip: 'Menú',
          ),
      ],
    );
  }
}
