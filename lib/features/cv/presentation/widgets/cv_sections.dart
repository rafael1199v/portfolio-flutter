import 'package:flutter/material.dart';

import '../../../../core/theme/cv_theme.dart';
import '../../domain/entities/education_item.dart';
import '../../domain/entities/experience_item.dart';
import '../../domain/entities/language_item.dart';
import '../../domain/entities/skill_group.dart';
import 'bullet_list.dart';
import 'experience_tile.dart';
import 'section_title.dart';

class _Section extends StatelessWidget {
  final String title;
  final Widget child;

  const _Section({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [SectionTitle(title), child],
      ),
    );
  }
}

class ProfileSection extends StatelessWidget {
  final String profile;
  const ProfileSection({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return _Section(
      title: 'Perfil',
      child: Text(
        profile,
        style: const TextStyle(
          fontSize: 13.5,
          height: 1.5,
          color: CvColors.textSecondary,
        ),
      ),
    );
  }
}

class ExperienceSection extends StatelessWidget {
  final List<ExperienceItem> experience;
  const ExperienceSection({super.key, required this.experience});

  @override
  Widget build(BuildContext context) {
    return _Section(
      title: 'Experiencia Técnica',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [for (final e in experience) ExperienceTile(item: e)],
      ),
    );
  }
}

class CertificationsSection extends StatelessWidget {
  final List<String> certifications;
  const CertificationsSection({super.key, required this.certifications});

  @override
  Widget build(BuildContext context) {
    return _Section(
      title: 'Cursos y Certificaciones',
      child: BulletList(items: certifications),
    );
  }
}

class EducationSection extends StatelessWidget {
  final List<EducationItem> education;
  const EducationSection({super.key, required this.education});

  @override
  Widget build(BuildContext context) {
    return _Section(
      title: 'Educación',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (final e in education)
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    e.period,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: CvColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    e.institution,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      height: 1.3,
                      color: CvColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 6, right: 8),
                        child: Icon(Icons.circle,
                            size: 5, color: CvColors.textSecondary),
                      ),
                      Expanded(
                        child: Text(
                          e.detail,
                          style: const TextStyle(
                            fontSize: 13,
                            color: CvColors.textSecondary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class SkillsSection extends StatelessWidget {
  final List<SkillGroup> technicalSkills;
  final List<String> softSkills;

  const SkillsSection({
    super.key,
    required this.technicalSkills,
    required this.softSkills,
  });

  @override
  Widget build(BuildContext context) {
    return _Section(
      title: 'Habilidades',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _SubHeader('Técnicas'),
          const SizedBox(height: 8),
          for (final s in technicalSkills)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 6, right: 8),
                    child: Icon(Icons.circle,
                        size: 5, color: CvColors.textSecondary),
                  ),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          fontSize: 13,
                          height: 1.4,
                          color: CvColors.textSecondary,
                        ),
                        children: [
                          TextSpan(
                            text: '${s.label}: ',
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              color: CvColors.textPrimary,
                            ),
                          ),
                          TextSpan(text: s.value),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          const SizedBox(height: 8),
          const _SubHeader('Blandas'),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final skill in softSkills)
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    border: Border.all(color: CvColors.divider),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    skill,
                    style: const TextStyle(
                      fontSize: 12.5,
                      color: CvColors.textSecondary,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class AchievementsSection extends StatelessWidget {
  final List<String> achievements;
  const AchievementsSection({super.key, required this.achievements});

  @override
  Widget build(BuildContext context) {
    return _Section(
      title: 'Logros',
      child: BulletList(items: achievements),
    );
  }
}

class LanguagesSection extends StatelessWidget {
  final List<LanguageItem> languages;
  const LanguagesSection({super.key, required this.languages});

  @override
  Widget build(BuildContext context) {
    return _Section(
      title: 'Idiomas',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (final lang in languages)
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    lang.language,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: CvColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  for (final level in lang.levels)
                    Padding(
                      padding: const EdgeInsets.only(left: 12, bottom: 2),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 6, right: 8),
                            child: Icon(Icons.circle,
                                size: 4, color: CvColors.textSecondary),
                          ),
                          Expanded(
                            child: Text(
                              level,
                              style: const TextStyle(
                                fontSize: 12.5,
                                color: CvColors.textSecondary,
                              ),
                            ),
                          ),
                        ],
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

class _SubHeader extends StatelessWidget {
  final String text;
  const _SubHeader(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 13.5,
        fontWeight: FontWeight.w700,
        color: CvColors.textPrimary,
      ),
    );
  }
}
