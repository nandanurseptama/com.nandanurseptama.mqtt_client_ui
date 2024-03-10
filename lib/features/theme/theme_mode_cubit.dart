import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// A class that control theme mode on user device
class ThemeModeCubit extends Cubit<ThemeMode> {
  ThemeModeCubit()
      : super(
          ThemeMode.dark,
        );

  /// switch current theme mode to [newValue] theme mode
  void switchMode(ThemeMode newValue) {
    emit(newValue);
    return;
  }

  /// Check if dark mode is enabled
  bool isDarkModeEnabled(BuildContext context) {
    // is theme mode not equal to system
    //
    // just check current state is dark or not
    if (ThemeMode.system != state) {
      return state == ThemeMode.dark;
    }

    // if theme mode is depend on system setting
    //
    // check the brightness
    final platformBrightness = MediaQuery.of(context).platformBrightness;
    final isDark = platformBrightness == Brightness.dark;

    return isDark;
  }
}
