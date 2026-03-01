import 'package:flutter/material.dart';
import 'package:news_app/core/theme/light_colors.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
  //   primaryContainer: Color(0xFFFFFFFF),
  //   primary: Color(0xFFD1DAD6),
  //   onPrimary: Color(0xFFD1DAD6),
    secondary: Color(0xFF363636),
  //   onSecondary: Color(0xFF14A662),
  //   surface: Color(0xFF3A4640),
  //   onSurface: Color(0xFF9E9E9E),
  ),
  scaffoldBackgroundColor: Color(0xFFF5F5F5),
  primaryColor: LightColors.primaryColor,
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xFFFFFFFF),
    titleTextStyle: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 16,
      color: Color(0xFF141414),
    ),
    centerTitle: true,
  ),
  // switchTheme: SwitchThemeData(
  //   trackColor: WidgetStateProperty.resolveWith((states) {
  //     if (states.contains(WidgetState.selected)) {
  //       return Color(0xFF14A662);
  //     }
  //     return Colors.white;
  //   }),
  //   thumbColor: WidgetStateProperty.resolveWith((states) {
  //     if (states.contains(WidgetState.selected)) {
  //       return Colors.white;
  //     }
  //     return Color(0xFF9E9E9E);
  //   }),
  //   trackOutlineColor: WidgetStateProperty.resolveWith((states) {
  //     if (states.contains(WidgetState.selected)) {
  //       return null;
  //     }
  //     return Color(0xFF9E9E9E);
  //   }),
  //   trackOutlineWidth: WidgetStateProperty.resolveWith((states) {
  //     if (states.contains(WidgetState.selected)) {
  //       return 0;
  //     }
  //     return 2;
  //   }),
  // ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Color(0xFFFFFCFC),
      backgroundColor: LightColors.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.zero
      )
    ),
  ),
  progressIndicatorTheme: ProgressIndicatorThemeData(
    color: Colors.black,
    strokeWidth: 2,
  ),
  textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: LightColors.primaryColor,
      ),

  ),
  // floatingActionButtonTheme: FloatingActionButtonThemeData(
  //   backgroundColor: Color(0xFF14A662),
  //   foregroundColor: Color(0xFFFFFCFC),
  //   extendedTextStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
  // ),
  // textTheme: TextTheme(
  //   displaySmall: TextStyle(
  //     fontSize: 24,
  //     fontWeight: FontWeight.w400,
  //     color: Color(0xFF161F1B),
  //   ),
  //   displayMedium: TextStyle(
  //     color: Color(0xFF161F1B),
  //     fontSize: 28,
  //     fontWeight: FontWeight.w400,
  //   ),
  //   displayLarge: TextStyle(
  //     fontSize: 32,
  //     fontWeight: FontWeight.w400,
  //     color: Color(0xFF161F1B),
  //   ),
  //   labelSmall: TextStyle(
  //     color: Color(0xFF161F1B),
  //     fontSize: 20,
  //     fontWeight: FontWeight.w400,
  //   ),
  //   labelLarge: TextStyle(color: Colors.black, fontSize: 24),
  //   labelMedium: TextStyle(color: Colors.black),
  //   titleSmall: TextStyle(
  //     fontWeight: FontWeight.w400,
  //     fontSize: 14,
  //     color: Color(0xFF3A4640),
  //   ),
  //   titleMedium: TextStyle(
  //     fontSize: 16,
  //     fontWeight: FontWeight.w400,
  //     color: Color(0xFF161F1B),
  //     overflow: TextOverflow.ellipsis,
  //   ),
  //   titleLarge: TextStyle(
  //     fontSize: 16,
  //     fontWeight: FontWeight.w400,
  //     color: Color(0xFFA0A0A0),
  //     decoration: TextDecoration.lineThrough,
  //     decorationColor: Color(0xFF6A6A6A),
  //     overflow: TextOverflow.ellipsis,
  //   ),
  // ),
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: TextStyle(color: Color(0xFF9E9E9E)),
    filled: true,
    fillColor: Color(0xFFFFFFFF),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.zero,
      borderSide: BorderSide(color: Color(0xFFD1DAD6), width: 0),
    ),
    focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.zero,
      borderSide: BorderSide(color: Color(0xFFD1DAD6), width: 0),
    ),
    enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.zero,
      borderSide: BorderSide(color: Color(0xFFD1DAD6), width: 0),
    ),
    errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.zero,
      borderSide: BorderSide(color: LightColors.primaryColor, width: 0.7),
    ),
  ),
  // checkboxTheme: CheckboxThemeData(
  //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
  //   side: BorderSide(color: Color(0xFFD1DAD6), width: 2),
  // ),
  // iconTheme: IconThemeData(color: Color(0xFF3A4640)),
  // dividerTheme: DividerThemeData(color: Color(0xFFD1DAD6), thickness: 1),
  // listTileTheme: ListTileThemeData(
  //   titleTextStyle: TextStyle(
  //     color: Color(0xFF161F1B),
  //     fontSize: 16,
  //     fontWeight: FontWeight.w400,
  //   ),
  // ),
  // textSelectionTheme: TextSelectionThemeData(
  //   cursorColor: Colors.grey,
  //   selectionHandleColor: Colors.grey,
  //   selectionColor: Colors.grey,
  // ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: LightColors.backgroundColor,
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Color(0xFF363636),
      selectedItemColor: LightColors.primaryColor,
      showUnselectedLabels: true
    ),

);
