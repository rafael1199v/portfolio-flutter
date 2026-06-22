import 'package:flutter/material.dart';

import '../../../../core/theme/portfolio_theme.dart';
import '../../../../core/utils/url_launcher_helper.dart';
import '../../domain/entities/portfolio_data.dart';
import 'common/menu_link.dart';
import 'common/theme_toggle.dart';
import 'dotted_background.dart';

class MobileMenu extends StatelessWidget {
  final PortfolioData data;
  final bool isDark;
  final VoidCallback onToggleTheme;
  final VoidCallback onClose;
  final VoidCallback onProfile;
  final VoidCallback onProjects;
  final VoidCallback onCareer;
  final VoidCallback onContact;

  const MobileMenu({
    super.key,
    required this.data,
    required this.isDark,
    required this.onToggleTheme,
    required this.onClose,
    required this.onProfile,
    required this.onProjects,
    required this.onCareer,
    required this.onContact,
  });

  @override
  Widget build(BuildContext context) {
    final c = PortfolioTheme.of(context);
    return Positioned.fill(
      child: DottedBackground(
        child: Container(
          color: c.background.withValues(alpha: 0.98),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
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
                  IconButton(
                    onPressed: onClose,
                    icon: const Icon(Icons.close, size: 24),
                    color: c.textPrimary,
                    tooltip: 'Cerrar',
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Divider(height: 1, color: c.border),
              const SizedBox(height: 28),
              MenuLink('PERFIL', onTap: onProfile),
              MenuLink('PROYECTOS', onTap: onProjects),
              MenuLink('EXPERIENCIA', onTap: onCareer),
              MenuLink('CONTACTO', accent: true, onTap: onContact),
              const SizedBox(height: 20),
              ThemeToggle(isDark: isDark, onTap: onToggleTheme),
              const Spacer(),
              Divider(height: 1, color: c.border),
              const SizedBox(height: 24),
              Text(
                '¿Tienes una pregunta o simplemente quieres conectar?',
                style: TextStyle(
                  fontFamily: kMonoFont,
                  fontSize: 14,
                  height: 1.6,
                  color: c.textSecondary,
                ),
              ),
              const SizedBox(height: 16),
              InkWell(
                onTap: () => openExternal(Uri(scheme: 'mailto', path: data.email)),
                child: Text(
                  data.email,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    color: c.textPrimary,
                  ),
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
