import 'package:flutter/material.dart';

class UIColor {
  static const primaryColor = Color(0xFFFFFFFF);
  static const accentColor = Color(0xFF18181C);
  static const fontColor = Color(0xFF000000);
  static const borderColor = Color(0xFF414144);
  static const inversFontColor = Color(0xFFFFFFFF);
  static const separateColor = Color(0xFFF3F3F3);
  static const sellColor = Color(0xFFFF07EC);
  static const buyColor = Color(0xFF00C41E);
  static const h2Color = fontColor;
  static const formFontColor = Color(0xFFA9A9A9);
  static const buttonColor = Color(0xFF18181C);
  static const List<BoxShadow> shadowBox = [
    BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.14),
      blurRadius: 1.0,
      offset: Offset(0, 1),
    ),
    BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.12),
      blurRadius: 1.0,
      offset: Offset(0, 2),
    ),
    BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.2),
      blurRadius: 3.0,
      offset: Offset(0, 1),
    ),
  ];
}
