import 'package:flutter/material.dart';

import '../../../../core/theme/portfolio_theme.dart';
import '../../domain/entities/portfolio_data.dart';
import 'common/section_heading.dart';
import 'common/section_label.dart';

class AboutSection extends StatelessWidget {
  final PortfolioData data;
  const AboutSection({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final c = PortfolioTheme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionLabel('SOBRE MÍ'),
        const SizedBox(height: 16),
        const SectionHeading('Descripción'),
        const SizedBox(height: 24),
        for (final p in data.aboutMe) ...[
          Text(
            p,
            style: TextStyle(
              fontFamily: kMonoFont,
              fontSize: 14.5,
              height: 1.8,
              color: c.textSecondary,
            ),
          ),
          const SizedBox(height: 16),
        ],
      ],
    );
  }
}
