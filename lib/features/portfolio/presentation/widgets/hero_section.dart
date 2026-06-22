import 'package:flutter/material.dart';

import '../../../../core/theme/portfolio_theme.dart';
import '../../../../core/utils/url_launcher_helper.dart';
import '../../../cv/presentation/pages/cv_page.dart';
import '../../domain/entities/portfolio_data.dart';
import 'common/outline_button.dart';
import 'common/section_label.dart';
import 'common/solid_button.dart';
import 'profile_frame.dart';

class HeroSection extends StatelessWidget {
  final PortfolioData data;
  final bool isWide;
  const HeroSection({super.key, required this.data, required this.isWide});

  @override
  Widget build(BuildContext context) {
    final c = PortfolioTheme.of(context);
    final textColumn = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionLabel('INTRODUCCIÓN'),
        const SizedBox(height: 24),
        RichText(
          text: TextSpan(
            style: TextStyle(
              fontSize: 52,
              fontWeight: FontWeight.w900,
              height: 1.05,
              letterSpacing: -1,
              color: c.textPrimary,
            ),
            children: [
              TextSpan(text: '${data.greeting} '),
              TextSpan(
                text: data.firstName,
                style: TextStyle(color: c.accent),
              ),
            ],
          ),
        ),
        const SizedBox(height: 28),
        for (final p in data.intro) ...[
          Text(
            p,
            style: TextStyle(
              fontFamily: kMonoFont,
              fontSize: 14.5,
              height: 1.7,
              color: c.textSecondary,
            ),
          ),
          const SizedBox(height: 16),
        ],
        const SizedBox(height: 16),
        Wrap(
          spacing: 14,
          runSpacing: 14,
          children: [
            SolidButton(
              label: 'VER CURRICULUM',
              icon: Icons.arrow_forward,
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const CvScreen()),
              ),
            ),
            OutlineButton(
              label: 'CONTACTAME',
              onTap: () => openExternal(Uri(scheme: 'mailto', path: data.email)),
            ),
          ],
        ),
      ],
    );

    if (!isWide) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfileFrame(data: data),
          const SizedBox(height: 40),
          textColumn,
        ],
      );
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(flex: 6, child: textColumn),
        const SizedBox(width: 48),
        Expanded(flex: 5, child: ProfileFrame(data: data)),
      ],
    );
  }
}
