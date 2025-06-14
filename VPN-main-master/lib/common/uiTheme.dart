import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class UiTheme {
  //Colors
  static const Color mainColor=Color(0xFF1E1E1E);
  static const Color selectColor=Color(0xFF555555);
  static const Color dividerColor=Color(0xFF858585);
  static const Color textWhite=Color(0xFFFFFFFF);
  static const Color textBlack=Color(0xFF1E1E1E);
  static const Color textLightGreen=Color(0xFF00FFA3);

  static getLightTheme() {
    return ThemeData(
      appBarTheme:const AppBarTheme(
        backgroundColor: UiTheme.mainColor,

      ),
      primaryColor: UiTheme.mainColor,
      floatingActionButtonTheme: FloatingActionButtonThemeData(elevation: 0, foregroundColor: Colors.white),
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: UiTheme.mainColor),
      dividerColor: UiTheme.dividerColor,

      textTheme: GoogleFonts.getTextTheme(
        'Open Sans',
        const TextTheme(
          headline3: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400, color: UiTheme.textLightGreen, height: 1.3),
          headline2: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w400, color: UiTheme.textBlack, height: 1.4),
          headline1: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w400, color: UiTheme.textWhite, height: 1.4),
          bodyText2: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w600, color: UiTheme.mainColor, height: 1.2),
          bodyText1: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400, color: UiTheme.mainColor, height: 1.2),
          caption: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w300, color: UiTheme.mainColor, height: 1.2),
        ),
      ),
      scaffoldBackgroundColor: UiTheme.mainColor,

      elevatedButtonTheme: const ElevatedButtonThemeData(
      ),
      dividerTheme:DividerThemeData(
        color: Color(0xFFCCCCCC),
      ),
    );
  }
}
