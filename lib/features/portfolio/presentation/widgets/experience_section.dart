import 'package:flutter/material.dart';

import '../../domain/entities/portfolio_data.dart';
import 'common/section_heading.dart';
import 'common/section_label.dart';
import 'experience_item.dart';

class WorkExperienceSection extends StatelessWidget {
  final PortfolioData data;
  const WorkExperienceSection({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionLabel('CARRERA'),
        const SizedBox(height: 16),
        const SectionHeading('Experiencia'),
        const SizedBox(height: 28),
        for (final e in data.experience) WorkExperienceItem(item: e),
      ],
    );
  }
}
