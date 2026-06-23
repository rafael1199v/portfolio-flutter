import 'experience.dart';
import 'project.dart';
import 'skill_group.dart';
import 'social_link.dart';
import 'stat.dart';

class PortfolioData {
  final String greeting;
  final String firstName;
  final String fullName;
  final String title;
  final List<String> intro;
  final List<String> aboutMe;
  final String email;
  final List<SocialLink> socials;
  final List<Project> projects;
  final List<Stat> stats;
  final List<SkillGroup> skills;
  final List<Experience> experience;
  final String avatarStyle;
  final String avatarSeed;

  const PortfolioData({
    required this.greeting,
    required this.firstName,
    required this.fullName,
    required this.title,
    required this.intro,
    required this.aboutMe,
    required this.email,
    required this.socials,
    required this.projects,
    required this.stats,
    required this.skills,
    required this.experience,
    this.avatarStyle = 'lorelei',
    this.avatarSeed = 'owddzeos',
  });
  String get avatarUrl =>
      'https://api.dicebear.com/10.x/$avatarStyle/svg?seed=$avatarSeed';
}
