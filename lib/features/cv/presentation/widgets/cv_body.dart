import 'package:flutter/material.dart';

import '../../domain/entities/cv_data.dart';
import 'cv_sections.dart';

class CvWideBody extends StatelessWidget {
  final CvData data;
  const CvWideBody({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileSection(profile: data.profile),
              ExperienceSection(experience: data.experience),
              CertificationsSection(certifications: data.certifications),
            ],
          ),
        ),
        const SizedBox(width: 36),
        Expanded(
          flex: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              EducationSection(education: data.education),
              SkillsSection(
                technicalSkills: data.technicalSkills,
                softSkills: data.softSkills,
              ),
              AchievementsSection(achievements: data.achievements),
              LanguagesSection(languages: data.languages),
            ],
          ),
        ),
      ],
    );
  }
}

class CvNarrowBody extends StatelessWidget {
  final CvData data;
  const CvNarrowBody({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProfileSection(profile: data.profile),
        EducationSection(education: data.education),
        ExperienceSection(experience: data.experience),
        SkillsSection(
          technicalSkills: data.technicalSkills,
          softSkills: data.softSkills,
        ),
        AchievementsSection(achievements: data.achievements),
        CertificationsSection(certifications: data.certifications),
        LanguagesSection(languages: data.languages),
      ],
    );
  }
}
