import 'package:flutter/material.dart';

import '../../../../core/theme/cv_theme.dart';
import '../../domain/entities/experience_item.dart';

class ExperienceTile extends StatelessWidget {
  final ExperienceItem item;

  const ExperienceTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 3, right: 8),
                child: Icon(Icons.crop_square, size: 12, color: CvColors.accent),
              ),
              Expanded(
                child: Text(
                  'Proyecto: ${item.project} - ${item.year}',
                  style: const TextStyle(
                    fontSize: 14.5,
                    fontWeight: FontWeight.w700,
                    color: CvColors.textPrimary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 6, right: 8),
                  child: Icon(Icons.circle, size: 5, color: CvColors.textSecondary),
                ),
                Expanded(
                  child: Text(
                    item.description,
                    style: const TextStyle(
                      fontSize: 13.5,
                      height: 1.45,
                      color: CvColors.textSecondary,
                    ),
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
