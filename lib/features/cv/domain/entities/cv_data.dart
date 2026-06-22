import 'contact_info.dart';
import 'education_item.dart';
import 'experience_item.dart';
import 'language_item.dart';
import 'skill_group.dart';

class CvData {
  final String name;
  final String role;
  final List<ContactInfo> contacts;
  final String profile;
  final List<EducationItem> education;
  final List<ExperienceItem> experience;
  final List<SkillGroup> technicalSkills;
  final List<String> softSkills;
  final List<String> achievements;
  final List<String> certifications;
  final List<LanguageItem> languages;

  const CvData({
    required this.name,
    required this.role,
    required this.contacts,
    required this.profile,
    required this.education,
    required this.experience,
    required this.technicalSkills,
    required this.softSkills,
    required this.achievements,
    required this.certifications,
    required this.languages,
  });
}
