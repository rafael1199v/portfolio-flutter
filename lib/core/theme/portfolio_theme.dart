import 'package:flutter/material.dart';


class PortfolioPalette {
  final Color background;
  final Color surface;
  final Color border;
  final Color dot;
  final Color textPrimary;
  final Color textSecondary;
  final Color textMuted;
  final Color accent;
  final Color ink;
  final Color onInk;

  final Brightness brightness;

  const PortfolioPalette({
    required this.background,
    required this.surface,
    required this.border,
    required this.dot,
    required this.textPrimary,
    required this.textSecondary,
    required this.textMuted,
    required this.accent,
    required this.ink,
    required this.onInk,
    required this.brightness,
  });

  static const PortfolioPalette light = PortfolioPalette(
    background: Color(0xFFF5F4F2),
    surface: Color(0xFFFCFBFA),
    border: Color(0xFFD9D7D2),
    dot: Color(0xFFDAD8D3),
    textPrimary: Color(0xFF161616),
    textSecondary: Color(0xFF555149),
    textMuted: Color(0xFF8A867E),
    accent: Color(0xFFB23A3A),
    ink: Color(0xFF161616),
    onInk: Color(0xFFFFFFFF),
    brightness: Brightness.light,
  );

  static const PortfolioPalette dark = PortfolioPalette(
    background: Color(0xFF121212),
    surface: Color(0xFF1B1B1B),
    border: Color(0xFF2E2D2B),
    dot: Color(0xFF242422),
    textPrimary: Color(0xFFF2F0EC),
    textSecondary: Color(0xFFB6B1A8),
    textMuted: Color(0xFF7E7A72),
    accent: Color(0xFFE06A5E),
    ink: Color(0xFFF2F0EC),
    onInk: Color(0xFF121212),
    brightness: Brightness.dark,
  );
}

class PortfolioTheme extends InheritedWidget {
  final PortfolioPalette palette;

  const PortfolioTheme({
    super.key,
    required this.palette,
    required super.child,
  });

  static PortfolioPalette of(BuildContext context) {
    final theme =
        context.dependOnInheritedWidgetOfExactType<PortfolioTheme>();
    return theme?.palette ?? PortfolioPalette.light;
  }

  @override
  bool updateShouldNotify(PortfolioTheme oldWidget) =>
      palette != oldWidget.palette;
}

const String kMonoFont = 'monospace';
const double kPortfolioMaxContentWidth = 1100;
const double kPortfolioWideBreakpoint = 820;
