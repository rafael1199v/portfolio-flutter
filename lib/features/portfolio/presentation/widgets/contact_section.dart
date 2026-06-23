import 'package:flutter/material.dart';

import '../../../../core/theme/portfolio_theme.dart';
import '../../../../core/utils/url_launcher_helper.dart';
import '../../domain/entities/portfolio_data.dart';
import 'common/section_heading.dart';
import 'common/section_label.dart';

class ContactSection extends StatelessWidget {
  final PortfolioData data;
  const ContactSection({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final c = PortfolioTheme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionLabel('CONTACTAME'),
        const SizedBox(height: 16),
        const SectionHeading('CONTACTO', fontSize: 48),
        const SizedBox(height: 20),
        Text(
          'No dudes en escribirme si quieres construir algo juntos, tienes una '
          'pregunta o simplemente quieres conectar.',
          style: TextStyle(
            fontFamily: kMonoFont,
            fontSize: 14.5,
            height: 1.7,
            color: c.textSecondary,
          ),
        ),
        const SizedBox(height: 24),
        InkWell(
          onTap: () => openExternal(Uri(scheme: 'mailto', path: data.email)),
          child: Text(
            data.email,
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w800,
              color: c.textPrimary,
            ),
          ),
        ),
        const SizedBox(height: 40),
        // Bloque "ELSEWHERE".
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: c.surface,
            border: Border.all(color: c.border),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'REDES SOCIALES',
                style: TextStyle(
                  fontFamily: kMonoFont,
                  fontSize: 11,
                  letterSpacing: 2,
                  color: c.textMuted,
                ),
              ),
              const SizedBox(height: 14),
              for (final s in data.socials) ...[
                InkWell(
                  onTap: () => s.label == 'Correo' ? openExternal(Uri(scheme: 'mailto', path: data.email)) : openExternal(Uri.parse(s.url)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        s.label.toUpperCase(),
                        style: TextStyle(
                          fontFamily: kMonoFont,
                          fontSize: 12,
                          letterSpacing: 1,
                          color: c.textSecondary,
                        ),
                      ),
                      Text(
                        s.url
                            .replaceFirst('mailto:', '')
                            .replaceFirst('https://', ''),
                        style: TextStyle(
                          fontFamily: kMonoFont,
                          fontSize: 12,
                          color: c.textPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ],
          ),
        ),
        const SizedBox(height: 36),
        Divider(color: c.border),
        const SizedBox(height: 14),
        Text(
          '© 2026 ${data.fullName}. Todos los derechos reservados.',
          style: TextStyle(
            fontFamily: kMonoFont,
            fontSize: 11.5,
            color: c.textMuted,
          ),
        ),
      ],
    );
  }
}
