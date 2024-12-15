import 'package:flutter/material.dart';

/// Class for managing theme mode (light, dark, system) using Provider.
/// Provides a mechanism for changing the theme and notifying listeners.
/// we dont neeed this for now but we could use it to control theme in future
class ThemeProvider with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system; // Default to system theme

  ThemeMode get themeMode => _themeMode;

  void setThemeMode(ThemeMode mode) {
    _themeMode = mode;
    notifyListeners();
  }
}
