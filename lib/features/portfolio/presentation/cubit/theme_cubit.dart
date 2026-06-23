import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeState()) {
    _load();
  }

  static const _storageKey = 'isDark';

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    final isDark = prefs.getBool(_storageKey) ?? false;
    if (isDark != state.isDark) emit(ThemeState(isDark: isDark));
  }

  Future<void> toggle() async {
    final next = !state.isDark;
    emit(ThemeState(isDark: next));
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_storageKey, next);
  }
}
