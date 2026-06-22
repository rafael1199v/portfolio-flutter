import 'package:flutter/material.dart';

import '../../../../core/theme/cv_theme.dart';
import '../../../../core/utils/url_launcher_helper.dart';
import '../../domain/entities/contact_info.dart';
import '../../domain/entities/cv_data.dart';
import '../../domain/enums/contact_type.dart';

class CvHeader extends StatelessWidget {
  final CvData data;
  final bool isWide;

  const CvHeader({super.key, required this.data, required this.isWide});

  @override
  Widget build(BuildContext context) {
    final nameBlock = Column(
      crossAxisAlignment:
          isWide ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: [
        Text(
          data.name,
          textAlign: isWide ? TextAlign.start : TextAlign.center,
          style: TextStyle(
            fontSize: isWide ? 44 : 34,
            fontWeight: FontWeight.w300,
            letterSpacing: 6,
            height: 1.1,
            color: CvColors.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          data.role,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            letterSpacing: 4,
            color: CvColors.textSecondary,
          ),
        ),
      ],
    );

    final contactBlock = Column(
      crossAxisAlignment:
          isWide ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: [
        for (final c in data.contacts) _ContactRow(info: c, center: !isWide),
      ],
    );

    return Container(
      width: double.infinity,
      color: CvColors.headerBackground,
      padding: EdgeInsets.symmetric(
        horizontal: isWide ? 40 : 24,
        vertical: isWide ? 36 : 28,
      ),
      child: isWide
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(flex: 5, child: nameBlock),
                const SizedBox(width: 24),
                Expanded(flex: 4, child: contactBlock),
              ],
            )
          : Column(
              children: [
                nameBlock,
                const SizedBox(height: 24),
                contactBlock,
              ],
            ),
    );
  }
}

class _ContactRow extends StatelessWidget {
  final ContactInfo info;
  final bool center;

  const _ContactRow({required this.info, required this.center});

  Uri? _uri() {
    switch (info.type) {
      case ContactType.phone:
        return Uri(scheme: 'tel', path: info.value);
      case ContactType.email:
        return Uri(scheme: 'mailto', path: info.value);
      case ContactType.linkedin:
      case ContactType.github:
        return Uri.parse(info.value);
      case ContactType.location:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final uri = _uri();
    final tappable = uri != null;
    final row = Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(info.icon, size: 16, color: CvColors.textSecondary),
        const SizedBox(width: 10),
        Flexible(
          child: Text(
            info.label,
            style: TextStyle(
              fontSize: 12.5,
              color: CvColors.textSecondary,
              decoration:
                  tappable ? TextDecoration.underline : TextDecoration.none,
            ),
          ),
        ),
      ],
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Align(
        alignment: center ? Alignment.center : Alignment.centerLeft,
        child: tappable
            ? InkWell(onTap: () => openExternal(uri), child: row)
            : row,
      ),
    );
  }
}
