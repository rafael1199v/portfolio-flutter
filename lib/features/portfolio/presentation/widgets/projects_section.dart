import 'package:flutter/material.dart';

import '../../../../core/theme/portfolio_theme.dart';
import '../../../../core/utils/url_launcher_helper.dart';
import '../../domain/entities/portfolio_data.dart';
import '../../domain/entities/project.dart';
import 'common/section_heading.dart';
import 'common/section_label.dart';
import 'project_card.dart';

class ProjectsSection extends StatelessWidget {
  final PortfolioData data;
  const ProjectsSection({super.key, required this.data});

  String? get _githubUrl {
    for (final s in data.socials) {
      if (s.label.toLowerCase() == 'github') return s.url;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final c = PortfolioTheme.of(context);
    final githubUrl = _githubUrl;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionLabel('SOFTWARE'),
        const SizedBox(height: 16),
        LayoutBuilder(
          builder: (context, constraints) {
            final link = githubUrl == null
                ? null
                : InkWell(
                    onTap: () => openExternal(Uri.parse(githubUrl)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Ver todos los repositorios',
                          style: TextStyle(
                            fontFamily: kMonoFont,
                            fontSize: 11.5,
                            letterSpacing: 1.5,
                            color: c.textSecondary,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Icon(Icons.north_east,
                            size: 13, color: c.textSecondary),
                      ],
                    ),
                  );

            if (constraints.maxWidth < 560) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SectionHeading('Proyectos Destacados'),
                  if (link != null) ...[
                    const SizedBox(height: 14),
                    link,
                  ],
                ],
              );
            }

            return Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Expanded(child: SectionHeading('Proyectos Destacados')),
                ?link,
              ],
            );
          },
        ),
        const SizedBox(height: 28),
        _Grid(projects: data.projects),
      ],
    );
  }
}

class _Grid extends StatelessWidget {
  final List<Project> projects;
  const _Grid({required this.projects});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final columns = width >= 880 ? 3 : (width >= 560 ? 2 : 1);
        const spacing = 16.0;
        final cardWidth = (width - spacing * (columns - 1)) / columns;
        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: [
            for (final p in projects)
              SizedBox(
                width: cardWidth,
                child: ProjectCard(project: p),
              ),
          ],
        );
      },
    );
  }
}
