import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

CustomTheme currentTheme = CustomTheme();

class CustomTheme with ChangeNotifier {
  static bool isDarkTheme = true;
  ThemeMode get currentTheme => isDarkTheme ? ThemeMode.dark : ThemeMode.light;
  void toggleTheme() {
    isDarkTheme = !isDarkTheme;
    print(isDarkTheme);
    notifyListeners();
  }

  static ThemeData get darkTheme {
    return ThemeData(
      //primarySwatch: Color(0xff570A57),
      backgroundColor: Color(0xff2E0249),
      scaffoldBackgroundColor: Color(0xff2E0249),
      textTheme: TextTheme(
        headline2: TextStyle(
          fontSize: 10,
          color: Color(0xffffffff),
        ),
      ),
      appBarTheme: AppBarTheme(
        color: Color(0xff570A57),
      ),
      primaryColor: Color(0xffA91079),
    );
  }

  static ThemeData get lightTheme {
    return ThemeData(
      //primarySwatch: Color(0xff570A57),
      backgroundColor: Color(0xffEFFFFD),
      scaffoldBackgroundColor: Color(0xffffffff),
      textTheme: TextTheme(
        headline2: TextStyle(
          fontSize: 10,
          color: Color(0xff000000),
        ),
      ),
      appBarTheme: AppBarTheme(
        color: Color(0xff42C2FF),
      ),
    );
  }
}
