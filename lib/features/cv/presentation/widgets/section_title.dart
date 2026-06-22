import 'package:flutter/material.dart';

import '../../../../core/theme/cv_theme.dart';

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title.toUpperCase(),
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 2,
            color: CvColors.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        const Divider(color: CvColors.divider, height: 1, thickness: 1),
        const SizedBox(height: 12),
      ],
    );
  }
}
