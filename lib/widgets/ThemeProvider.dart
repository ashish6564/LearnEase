// import 'package:flutter/material.dart';
//
// import '../utils/constants.dart';
//
// class ThemeProvider with ChangeNotifier {
//   late ThemeMode _themeMode = ThemeMode.system;
//   late ColorScheme _darkScheme = Constants.darkColorScheme;
//   late ColorScheme _lightScheme = Constants.lightColorScheme;
//   ThemeMode get themeMode => _themeMode;
//   void setThemeMode(ThemeMode value) {
//     _themeMode = value;
//     notifyListeners();
//   }
//   ColorScheme get darkScheme => _darkScheme;
//   void setDarkScheme(ColorScheme value) {
//     _darkScheme = value;
//     notifyListeners();
//   }
//   ColorScheme get lightScheme => _lightScheme;
//   void setLightScheme(ColorScheme value) {
//     _lightScheme = value;
//     notifyListeners();
//   }
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeNotifier with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;
  ThemeMode get themeMode => _themeMode;
  void setTheme(ThemeMode mode) {
    _themeMode = mode;
    notifyListeners();
  }
}
