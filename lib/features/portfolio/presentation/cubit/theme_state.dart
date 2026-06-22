import '../../../../core/theme/portfolio_theme.dart';

class ThemeState {
  final bool isDark;

  const ThemeState({this.isDark = false});

  PortfolioPalette get palette =>
      isDark ? PortfolioPalette.dark : PortfolioPalette.light;

  @override
  bool operator ==(Object other) =>
      other is ThemeState && other.isDark == isDark;

  @override
  int get hashCode => isDark.hashCode;
}
