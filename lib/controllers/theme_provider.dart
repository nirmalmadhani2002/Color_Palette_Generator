import 'package:flutter/material.dart';
import '../Modals/theme_model.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeModel ld1 = ThemeModel(isDark: false);

  void changeTheme(){
    ld1.isDark = !ld1.isDark;
    notifyListeners();
  }
}