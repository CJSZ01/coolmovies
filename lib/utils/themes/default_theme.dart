import 'package:coolmovies/utils/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DefaultTheme {
  static ThemeData get themeData => _themeData;

  static final ThemeData _themeData = ThemeData(
    fontFamily: GoogleFonts.signika().fontFamily,
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.purple,
      backgroundColor: DefaultColors.background,
    ),
    scaffoldBackgroundColor: DefaultColors.background,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
        ),
      ),
    ),
    textTheme: TextTheme(
      headline1: GoogleFonts.signika(
        fontSize: 99,
        fontWeight: FontWeight.w300,
        letterSpacing: -1.5,
      ),
      headline2: GoogleFonts.signika(
        fontSize: 62,
        fontWeight: FontWeight.w300,
        letterSpacing: -0.5,
      ),
      headline3: GoogleFonts.signika(fontSize: 49, fontWeight: FontWeight.w400),
      headline4: GoogleFonts.signika(
        fontSize: 35,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
      ),
      headline5: GoogleFonts.signika(fontSize: 25, fontWeight: FontWeight.w400),
      headline6: GoogleFonts.signika(
        fontSize: 21,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15,
      ),
      subtitle1: GoogleFonts.signika(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15,
      ),
      subtitle2: GoogleFonts.signika(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
      ),
      bodyText1: GoogleFonts.signika(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
      ),
      bodyText2: GoogleFonts.signika(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
      ),
      button: GoogleFonts.signika(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.25,
      ),
      caption: GoogleFonts.signika(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4,
      ),
      overline: GoogleFonts.signika(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        letterSpacing: 1.5,
      ),
    ),
  );
}
