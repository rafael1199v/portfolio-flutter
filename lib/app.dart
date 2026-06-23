import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/theme/cv_theme.dart';
import 'features/portfolio/presentation/cubit/theme_cubit.dart';
import 'features/portfolio/presentation/pages/portfolio_page.dart';

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ThemeCubit(),
      child: MaterialApp(
        title: 'Portafolio - Rafael Vargas',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: CvColors.background,
          colorScheme: ColorScheme.fromSeed(
            seedColor: CvColors.accent,
            brightness: Brightness.light,
          ),
          fontFamily: 'Roboto',
        ),
        home: const PortfolioScreen(),
      ),
    );
  }
}
