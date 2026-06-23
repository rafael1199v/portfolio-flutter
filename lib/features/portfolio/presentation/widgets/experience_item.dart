import 'package:flutter/material.dart';

import '../../../../core/theme/portfolio_theme.dart';
import '../../domain/entities/experience.dart';

class WorkExperienceItem extends StatelessWidget {
  final Experience item;
  const WorkExperienceItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final c = PortfolioTheme.of(context);
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: c.surface,
        border: Border.all(color: c.border),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 4, right: 16),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: c.accent),
            child: const Icon(Icons.work_outline, size: 16, color: Colors.white),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        item.company,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: c.textPrimary,
                        ),
                      ),
                    ),
                    Text(
                      item.period,
                      style: TextStyle(
                        fontFamily: kMonoFont,
                        fontSize: 11.5,
                        letterSpacing: 0.5,
                        color: c.textMuted,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  item.role,
                  style: TextStyle(
                    fontFamily: kMonoFont,
                    fontSize: 13,
                    letterSpacing: 1,
                    color: c.accent,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Icon(Icons.location_on_outlined,
                        size: 13, color: c.textMuted),
                    const SizedBox(width: 4),
                    Text(
                      item.location,
                      style: TextStyle(
                        fontFamily: kMonoFont,
                        fontSize: 12,
                        color: c.textMuted,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  item.description,
                  style: TextStyle(
                    fontFamily: kMonoFont,
                    fontSize: 13,
                    height: 1.6,
                    color: c.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
