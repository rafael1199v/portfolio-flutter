import 'package:flutter/material.dart';

import '../../../../core/theme/portfolio_theme.dart';
import '../../../../core/utils/url_launcher_helper.dart';
import '../../domain/entities/project.dart';
import 'common/tag.dart';

class ProjectCard extends StatelessWidget {
  final Project project;
  const ProjectCard({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final c = PortfolioTheme.of(context);
    return InkWell(
      onTap: project.url.isEmpty
          ? null
          : () => openExternal(Uri.parse(project.url), context: context),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: c.surface,
          border: Border.all(color: c.border),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.folder_outlined, size: 18, color: c.textSecondary),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    project.name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: c.textPrimary,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: project.url.isEmpty
                      ? null
                      : () => openExternal(
                          Uri.parse(project.url),
                          context: context,
                        ),
                  icon: Icon(Icons.north_east, size: 14, color: c.textMuted),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              project.description,
              style: TextStyle(
                fontFamily: kMonoFont,
                fontSize: 12.5,
                height: 1.6,
                color: c.textSecondary,
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: [for (final t in project.tags) Tag(t)],
            ),
            const SizedBox(height: 18),
            Divider(height: 1, color: c.border),
            const SizedBox(height: 12),
            Row(
              children: [
                Container(width: 11, height: 11, color: project.languageColor),
                const SizedBox(width: 6),
                Text(
                  project.language.toUpperCase(),
                  style: TextStyle(
                    fontFamily: kMonoFont,
                    fontSize: 11,
                    letterSpacing: 1,
                    color: c.textSecondary,
                  ),
                ),
                const SizedBox(width: 14),
                if (project.version.isNotEmpty) _meta(context, project.version),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _meta(BuildContext context, String text) {
    final c = PortfolioTheme.of(context);
    return Text(
      text,
      style: TextStyle(fontFamily: kMonoFont, fontSize: 11, color: c.textMuted),
    );
  }
}
