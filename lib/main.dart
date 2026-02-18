import 'package:flutter/material.dart';
import 'package:news_app/features/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(),
        primaryColor: Color(0xFFC53030),
      ),
      home: const SplashScreen(),
    );
  }
}

