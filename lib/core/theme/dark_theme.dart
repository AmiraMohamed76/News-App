import 'package:flutter/material.dart';
import 'package:news_app/core/constants/app_sizes.dart';
import 'package:news_app/core/theme/light_colors.dart';

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    surface: DarkColors.lightGeryColor,
    primary: Color(0xFFFFFCFC),
    secondary: DarkColors.geryColor,
    onSurface:DarkColors.whiteColor,
    onPrimary: DarkColors.whiteColor,
    onSecondary: DarkColors.geryColor,
    primaryContainer: Color(0xFF141414),
  ),
  scaffoldBackgroundColor: DarkColors.scaffoldBackgroundColor,
  primaryColor: DarkColors.primaryColor,
  appBarTheme: AppBarTheme(
    backgroundColor: DarkColors.appBarColor,
    titleTextStyle: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: AppSizes.sp16,
      color: DarkColors.appBarTextColor,
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
  //     return DarkColors.geryColor;
  //   }),
  //   trackOutlineColor: WidgetStateProperty.resolveWith((states) {
  //     if (states.contains(WidgetState.selected)) {
  //       return null;
  //     }
  //     return DarkColors.geryColor;
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
      foregroundColor: DarkColors.whiteColor,
      backgroundColor: DarkColors.primaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      minimumSize: Size.fromHeight(AppSizes.h52),
    ),
  ),
  progressIndicatorTheme: ProgressIndicatorThemeData(
    color: Colors.black,
    strokeWidth: 2,
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(foregroundColor: DarkColors.primaryColor),
  ),
  // floatingActionButtonTheme: FloatingActionButtonThemeData(
  //   backgroundColor: Color(0xFF14A662),
  //   foregroundColor: DarkColors.whiteColor,
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
      color: DarkColors.blackColor,
      fontSize: AppSizes.sp12,
      fontWeight: FontWeight.w400,
    ),
    labelMedium: TextStyle(
      fontSize: AppSizes.sp14,
      fontWeight: FontWeight.w400,
      color: DarkColors.blackColor,
    ),
    labelLarge: TextStyle(
      fontSize: AppSizes.sp16,
      fontWeight: FontWeight.w700,
    ),
    titleSmall: TextStyle(
      fontSize: AppSizes.sp16,
      fontWeight: FontWeight.w400,
      color: DarkColors.primaryColor,
    ),
    titleMedium: TextStyle(
      fontSize: AppSizes.sp20,
      fontWeight: FontWeight.w700,
    ),
    titleLarge: TextStyle(
      fontSize: AppSizes.sp40,
      fontWeight: FontWeight.w600,
      color: DarkColors.primaryColor,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: TextStyle(color: DarkColors.geryColor),
    filled: true,
    fillColor: DarkColors.backgroundColor,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.zero,
      borderSide: BorderSide(color: DarkColors.backgroundColor, width: 0),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.zero,
      borderSide: BorderSide(color: DarkColors.backgroundColor, width: 0),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.zero,
      borderSide: BorderSide(color: DarkColors.backgroundColor, width: 0),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.zero,
      borderSide: BorderSide(color: DarkColors.backgroundColor, width: 0.7),
    ),
  ),
  // checkboxTheme: CheckboxThemeData(
  //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
  //   side: BorderSide(color: DarkColors.lightGeryColor, width: 2),
  // ),
  // iconTheme: IconThemeData(color: Color(0xFF3A4640)),
  // dividerTheme: DividerThemeData(color: DarkColors.lightGeryColor, thickness: 1),
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
    backgroundColor: DarkColors.backgroundColor,
    type: BottomNavigationBarType.fixed,
    unselectedItemColor: DarkColors.darkGeryColor,
    selectedItemColor: DarkColors.primaryColor,
    showUnselectedLabels: true,
  ),
);
