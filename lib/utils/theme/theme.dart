import 'package:Readify/utils/theme/custom_themes/appbar_theme.dart';
import 'package:Readify/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:Readify/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:Readify/utils/theme/custom_themes/chip_theme.dart';
import 'package:Readify/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:Readify/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:Readify/utils/theme/custom_themes/text_field_theme.dart';
import 'package:Readify/utils/theme/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';

class ReadifyAppTheme {
  ReadifyAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.green,
    textTheme: ReadifyTextTheme.lightTextTheme,
    chipTheme: ReadifyChipTheme.lightChipThemeData,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: ReadifyAppBarTheme.lightAppBarTheme,
    checkboxTheme: ReadifyCheckboxTheme.lightCheckboxThemeData,
    bottomSheetTheme: ReadifyBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: ReadifyElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: ReadifyOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: ReadifyTextFormfieldTheme.lightInputDecorationTheme,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.green,
    textTheme: ReadifyTextTheme.darkTextTheme,
    chipTheme: ReadifyChipTheme.darkChipThemeData,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: ReadifyAppBarTheme.darkAppBarTheme,
    checkboxTheme: ReadifyCheckboxTheme.darkCheckboxThemeData,
    bottomSheetTheme: ReadifyBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: ReadifyElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: ReadifyOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: ReadifyTextFormfieldTheme.darkInputDecorationTheme,
  );
}
