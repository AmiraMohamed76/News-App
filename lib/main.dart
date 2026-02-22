import 'package:flutter/material.dart';
import 'package:news_app/core/theme/light_theme.dart';
import 'package:news_app/features/onboarding/onboarding_screen.dart';
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
      theme: lightTheme,
      home: const OnboardingScreen(),
    );
  }
}

