import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/data_source/local_data/preferences_manager.dart';
import 'package:news_app/core/services/theme_controller.dart';
import 'package:news_app/core/theme/dark_theme.dart';
import 'package:news_app/core/theme/light_theme.dart';
import 'package:news_app/features/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();

  await PreferencesManager().init();
  ThemeController().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: ThemeController.themeNotifier,
      builder: (context, value, child) {
        return ScreenUtilInit(
            designSize: Size(375, 832),
            minTextAdapt: true,
            builder: (ctx, _) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Newst App',
                theme: lightTheme,
                darkTheme: darkTheme,
                themeMode: value,
                home: const SplashScreen(),
              );
            },
          );
      },
    ) ;
  }
}

