import 'package:cryptotest/common/ui_colors.dart';
import 'package:flutter/material.dart';

final ThemeData blackTheme = ThemeData.dark().copyWith(
  brightness: Brightness.dark,
  primaryColor: UIColor.primaryColor,
  appBarTheme: const AppBarTheme(
    color: UIColor.accentColor,
  ),
  scaffoldBackgroundColor: UIColor.primaryColor,
);
