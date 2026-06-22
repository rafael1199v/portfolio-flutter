import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/portfolio_theme.dart';
import '../../domain/entities/portfolio_data.dart';

class ProfileFrame extends StatelessWidget {
  final PortfolioData data;
  const ProfileFrame({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final c = PortfolioTheme.of(context);
    return Stack(
      children: [
        // Marco desplazado de fondo.
        Padding(
          padding: const EdgeInsets.only(left: 22, top: 22),
          child: Container(
            height: 360,
            decoration: BoxDecoration(border: Border.all(color: c.border)),
          ),
        ),
        Container(
          height: 360,
          margin: const EdgeInsets.only(right: 22, bottom: 22),
          decoration: BoxDecoration(
            color: c.surface,
            border: Border.all(color: c.accent, width: 2),
          ),
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.network(
                  data.avatarUrl,
                  fit: BoxFit.cover,
                  placeholderBuilder: (context) => Center(
                    child: SizedBox(
                      width: 28,
                      height: 28,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: c.accent,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                bottom: 0,
                child: Container(
                  color: Colors.black.withValues(alpha: 0.75),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: Text(
                    '>_ ${data.title}',
                    style: const TextStyle(
                      fontFamily: kMonoFont,
                      fontSize: 11,
                      letterSpacing: 1,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
