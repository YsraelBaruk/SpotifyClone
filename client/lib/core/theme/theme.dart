import 'package:client/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class AppTheme {
  
  static OutlineInputBorder _border(Color color) => OutlineInputBorder(
    borderSide: BorderSide(
        color: color,
        width: 3,
      ),
    borderRadius: BorderRadius.all(Radius.circular(10))
  );

  static final darkThemeMode = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Pallete.backgroundColor,
    inputDecorationTheme: InputDecorationTheme(
       contentPadding: const EdgeInsets.all(27),
        enabledBorder: _border(Pallete.borderColor),
        focusedBorder: _border(Pallete.gradient2),  
    ),
  );
}