import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/portfolio_theme.dart';
import '../../data/portfolio_data.dart';
import '../cubit/theme_cubit.dart';
import '../cubit/theme_state.dart';
import '../widgets/about_section.dart';
import '../widgets/contact_section.dart';
import '../widgets/dotted_background.dart';
import '../widgets/experience_section.dart';
import '../widgets/hero_section.dart';
import '../widgets/mobile_menu.dart';
import '../widgets/projects_section.dart';
import '../widgets/side_rail.dart';
import '../widgets/top_bar.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  final _scrollController = ScrollController();
  final _profileKey = GlobalKey();
  final _projectsKey = GlobalKey();
  final _experienceKey = GlobalKey();
  final _contactKey = GlobalKey();

  bool _menuOpen = false;
  String _activeSection = 'profile';

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final sections = <(String, GlobalKey)>[
      ('profile', _profileKey),
      ('experience', _experienceKey),
      ('projects', _projectsKey),
      ('contact', _contactKey),
    ];
    const trigger = 140.0;
    var current = 'profile';
    for (final (name, key) in sections) {
      final ctx = key.currentContext;
      if (ctx == null) continue;
      final box = ctx.findRenderObject() as RenderBox?;
      if (box == null) continue;
      final dy = box.localToGlobal(Offset.zero).dy;
      if (dy <= trigger) current = name;
    }
    if (current != _activeSection) {
      setState(() => _activeSection = current);
    }
  }

  void _scrollTo(GlobalKey key) {
    final ctx = key.currentContext;
    if (ctx == null) return;
    Scrollable.ensureVisible(
      ctx,
      duration: const Duration(milliseconds: 450),
      curve: Curves.easeInOut,
      alignment: 0.02,
    );
  }

  void _goTo(GlobalKey key) {
    if (_menuOpen) {
      setState(() => _menuOpen = false);
      WidgetsBinding.instance.addPostFrameCallback((_) => _scrollTo(key));
    } else {
      _scrollTo(key);
    }
  }

  @override
  Widget build(BuildContext context) {
    const data = portfolioData;
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        final toggleTheme = context.read<ThemeCubit>().toggle;
        return PortfolioTheme(
          palette: state.palette,
          child: Builder(
            builder: (context) {
              final c = PortfolioTheme.of(context);
              return PopScope(
                canPop: !_menuOpen,
                onPopInvokedWithResult: (didPop, result) {
                  if (!didPop && _menuOpen) {
                    setState(() => _menuOpen = false);
                  }
                },
                child: Scaffold(
                  backgroundColor: c.background,
                  body: DottedBackground(
                    child: SafeArea(
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          final isWide =
                              constraints.maxWidth >= kPortfolioWideBreakpoint;
                          return Stack(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  if (isWide) const SideRail(data: data),
                                  Expanded(
                                    child: SingleChildScrollView(
                                      controller: _scrollController,
                                      child: Center(
                                        child: ConstrainedBox(
                                          constraints: const BoxConstraints(
                                            maxWidth: kPortfolioMaxContentWidth,
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: isWide ? 40 : 20,
                                              vertical: 20,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                TopBar(
                                                  isWide: isWide,
                                                  isDark: state.isDark,
                                                  activeSection: _activeSection,
                                                  onToggleTheme: toggleTheme,
                                                  onProfile: () =>
                                                      _goTo(_profileKey),
                                                  onProjects: () =>
                                                      _goTo(_projectsKey),
                                                  onCareer: () =>
                                                      _goTo(_experienceKey),
                                                  onContact: () =>
                                                      _goTo(_contactKey),
                                                  onMenu: () => setState(
                                                    () => _menuOpen = true,
                                                  ),
                                                ),
                                                const SizedBox(height: 56),
                                                HeroSection(
                                                  key: _profileKey,
                                                  data: data,
                                                  isWide: isWide,
                                                ),
                                                const SizedBox(height: 96),
                                                const AboutSection(data: data),
                                                const SizedBox(height: 96),
                                                WorkExperienceSection(
                                                  key: _experienceKey,
                                                  data: data,
                                                ),
                                                const SizedBox(height: 96),
                                                ProjectsSection(
                                                  key: _projectsKey,
                                                  data: data,
                                                ),
                                                const SizedBox(height: 96),
                                                ContactSection(
                                                  key: _contactKey,
                                                  data: data,
                                                ),
                                                const SizedBox(height: 48),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              if (_menuOpen)
                                MobileMenu(
                                  data: data,
                                  isDark: state.isDark,
                                  onToggleTheme: toggleTheme,
                                  onClose: () =>
                                      setState(() => _menuOpen = false),
                                  onProfile: () => _goTo(_profileKey),
                                  onProjects: () => _goTo(_projectsKey),
                                  onCareer: () => _goTo(_experienceKey),
                                  onContact: () => _goTo(_contactKey),
                                ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
