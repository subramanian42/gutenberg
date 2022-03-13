import 'package:flutter/material.dart';

class CustomTextStyle {
  static const Color _primaryColor = Color(0xff5E56E7);
  static const Color _tertiaryColor = Color(0xffA0A0A0);
  static const Color _onTertiaryColor = Color(0xff333333);
  static const Color _labelColor = Color(0xffe1563e);

  static const TextTheme textTheme = TextTheme(
    headline1: heading1TextStyle,
    headline2: heading2TextStyle,
    headline3: heading3TextStyle,
    bodyText1: body1TextStyle,
    bodyText2: body2TextStyle,
    subtitle1: subtitle1TextStyle,
    subtitle2: subtitle2TextStyle,
    labelMedium: labelMediumTextStyle,
    button: buttonTextStyle,
  );
  static const TextStyle heading1TextStyle = TextStyle(
      // heading 1
      fontSize: 48,
      fontWeight: FontWeight.w600,
      color: _primaryColor,
      fontFamily: "montserat");
  static const TextStyle heading2TextStyle = TextStyle(
      // heading 2
      fontSize: 30,
      fontWeight: FontWeight.w600,
      color: _primaryColor,
      fontFamily: "montserat");
  static const TextStyle heading3TextStyle = TextStyle(
      // genre card
      fontSize: 20,
      fontWeight: FontWeight.normal,
      color: _onTertiaryColor,
      fontFamily: "montserat");
  static const TextStyle body1TextStyle = TextStyle(
      //body
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: _onTertiaryColor,
      fontFamily: "montserat");
  static const TextStyle body2TextStyle = TextStyle(
      //book name

      fontSize: 12,
      height: 1.5,
      fontWeight: FontWeight.normal,
      color: _onTertiaryColor,
      fontFamily: "montserat");
  static const TextStyle subtitle1TextStyle = TextStyle(
      //searchbox
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: _tertiaryColor,
      fontFamily: "montserat");
  static const TextStyle subtitle2TextStyle = TextStyle(
      //book author
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: _tertiaryColor,
      fontFamily: "montserat");
  static const TextStyle labelMediumTextStyle = TextStyle(
      //error text
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: _labelColor,
      fontFamily: "montserat");
  static const TextStyle buttonTextStyle = TextStyle(
      // button color
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: _primaryColor,
      fontFamily: "montserat");
}
