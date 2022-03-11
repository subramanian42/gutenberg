import 'package:flutter/material.dart';
import 'package:gutenberg/utils/theme/text_theme.dart';

class AppTheme {
  AppTheme._();

  static const Color _primaryColor = Color(0xff5E56E7);
  static const Color _secondaryColor = Color(0xffF8F7FF);
  static const Color _onSecondaryColor = Color(0xffF0F0F6);

  static const Color _tertiaryColor = Color(0xffA0A0A0);
  static const Color _onTertiaryColor = Color(0xff333333);

  static final ThemeData customTheme = ThemeData(
    backgroundColor: _secondaryColor,
    colorScheme: const ColorScheme.light(
      primary: _primaryColor,
      secondary: _secondaryColor,
      onSecondary: _onSecondaryColor,
      tertiary: _tertiaryColor,
      onTertiary: _onTertiaryColor,
    ),
    // unselectedWidgetColor: const Color(0xffE5EBF0),
    buttonTheme: const ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
    ),
    iconTheme: const IconThemeData(
      color: _primaryColor,
    ),
    textTheme: CustomTextStyle.textTheme,
  );
}
