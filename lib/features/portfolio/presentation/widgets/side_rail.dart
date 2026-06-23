import 'package:flutter/material.dart';

import '../../../../core/theme/portfolio_theme.dart';
import '../../../../core/utils/url_launcher_helper.dart';
import '../../domain/entities/portfolio_data.dart';

class SideRail extends StatelessWidget {
  final PortfolioData data;
  const SideRail({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final c = PortfolioTheme.of(context);
    return Container(
      width: 64,
      decoration: BoxDecoration(
        border: Border(right: BorderSide(color: c.border)),
      ),
      child: Column(
        children: [
          const Spacer(),
          for (final s in data.socials)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: InkWell(
                onTap: () => s.label == 'Correo'? openExternal(Uri(scheme: 'mailto', path: data.email)) : openExternal(Uri.parse(s.url)),
                child: Icon(s.icon, size: 18, color: c.textSecondary),
              ),
            ),
          const Spacer(),
          RotatedBox(
            quarterTurns: 3,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                '${data.fullName.toUpperCase()}.DEV',
                style: TextStyle(
                  fontFamily: kMonoFont,
                  fontSize: 11,
                  letterSpacing: 3,
                  color: c.textMuted,
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
