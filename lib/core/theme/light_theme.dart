import 'package:flutter/material.dart';
import 'package:news_app/core/constants/app_sizes.dart';
import 'package:news_app/core/theme/light_colors.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    //   primaryContainer: Color(0xFFFFFFFF),
    //   primary: LightColors.lightGeryColor,
    //   onPrimary: LightColors.lightGeryColor,
    secondary: LightColors.darkGeryColor,
    //   onSecondary: Color(0xFF14A662),
    //   surface: Color(0xFF3A4640),
    //   onSurface: LightColors.geryColor,
  ),
  scaffoldBackgroundColor: LightColors.scaffoldBackgroundColor,
  primaryColor: LightColors.primaryColor,
  appBarTheme: AppBarTheme(
    backgroundColor: LightColors.appBarColor,
    titleTextStyle: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: AppSizes.sp16,
      color: LightColors.appBarTextColor,
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
  //     return LightColors.geryColor;
  //   }),
  //   trackOutlineColor: WidgetStateProperty.resolveWith((states) {
  //     if (states.contains(WidgetState.selected)) {
  //       return null;
  //     }
  //     return LightColors.geryColor;
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
      foregroundColor: LightColors.whiteColor,
      backgroundColor: LightColors.primaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      minimumSize: Size.fromHeight(AppSizes.h52),
    ),
  ),
  progressIndicatorTheme: ProgressIndicatorThemeData(
    color: Colors.black,
    strokeWidth: 2,
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(foregroundColor: LightColors.primaryColor),
  ),
  // floatingActionButtonTheme: FloatingActionButtonThemeData(
  //   backgroundColor: Color(0xFF14A662),
  //   foregroundColor: LightColors.whiteColor,
  //   extendedTextStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
  // ),
  textTheme: TextTheme(
    displaySmall: TextStyle(
      fontSize: AppSizes.sp14,
      fontWeight: FontWeight.w400,
      decoration: TextDecoration.underline,
    ),
    displayMedium: TextStyle(
      fontSize: AppSizes.sp16,
      fontWeight: FontWeight.w700,
    ),
    labelSmall: TextStyle(
      color: LightColors.backColor,
      fontSize: AppSizes.sp12,
      fontWeight: FontWeight.w400,
    ),
    labelMedium: TextStyle(
      fontSize: AppSizes.sp14,
      fontWeight: FontWeight.w400,
      color: LightColors.backColor,
    ),
    labelLarge: TextStyle(
      fontSize: AppSizes.sp16,
      fontWeight: FontWeight.w700,
    ),
    titleSmall: TextStyle(
      fontSize: AppSizes.sp16,
      fontWeight: FontWeight.w400,
      color: LightColors.primaryColor,
    ),
    titleMedium: TextStyle(
      fontSize: AppSizes.sp20,
      fontWeight: FontWeight.w700,
    ),
    titleLarge: TextStyle(
      fontSize: AppSizes.sp40,
      fontWeight: FontWeight.w600,
      color: LightColors.primaryColor,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: TextStyle(color: LightColors.geryColor),
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.zero,
      borderSide: BorderSide(color: LightColors.lightGeryColor, width: 0),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.zero,
      borderSide: BorderSide(color: LightColors.lightGeryColor, width: 0),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.zero,
      borderSide: BorderSide(color: LightColors.lightGeryColor, width: 0),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.zero,
      borderSide: BorderSide(color: LightColors.primaryColor, width: 0.7),
    ),
  ),
  // checkboxTheme: CheckboxThemeData(
  //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
  //   side: BorderSide(color: LightColors.lightGeryColor, width: 2),
  // ),
  // iconTheme: IconThemeData(color: Color(0xFF3A4640)),
  // dividerTheme: DividerThemeData(color: LightColors.lightGeryColor, thickness: 1),
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
    unselectedItemColor: LightColors.darkGeryColor,
    selectedItemColor: LightColors.primaryColor,
    showUnselectedLabels: true,
  ),
);
