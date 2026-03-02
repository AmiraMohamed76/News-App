import 'package:flutter/material.dart';
import 'package:news_app/core/constants/storage_key.dart';
import 'package:news_app/core/data_source/local_data/preferences_manager.dart';
import 'package:news_app/features/auth/login_screen.dart';
import 'package:news_app/features/navigation/main_screen.dart';
import 'package:news_app/features/onboarding/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _navigateAfterSplash();
    super.initState();
  }

  void _navigateAfterSplash() async {
    await Future.delayed(Duration(seconds: 5));

    final bool onboardingComplete =
        PreferencesManager().getBool(StorageKey.onboardingComplete) ?? false;
    final bool isLoggedIn =
        PreferencesManager().getBool(StorageKey.isLoggedIn) ?? false;

    if (!mounted) return;
    if (!onboardingComplete) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) {
            return OnboardingScreen();
          },
        ),
      );
    } else if (!isLoggedIn) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) {
            return LoginScreen();
          },
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) {
            return MainScreen();
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(
        "assets/images/splash.png",
        width: double.infinity,
        fit: BoxFit.fill,
      ),
    );
  }
}
