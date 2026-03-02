import 'package:flutter/material.dart';
import 'package:news_app/core/constants/storage_key.dart';
import 'package:news_app/core/data_source/local_data/preferences_manager.dart';
import 'package:news_app/features/auth/login_screen.dart';

class OnboardingController extends ChangeNotifier {
  final PageController pageController = PageController();

  int currentIndex = 0;
  bool isLastPage = false;

  void onPageChanged(int index) {
    currentIndex = index;
    index == 2 ? isLastPage = true : isLastPage = false;
    notifyListeners();
  }

  void onNextPage() {
    pageController.nextPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    notifyListeners();
  }

  void onFinish(BuildContext context) async {
    await PreferencesManager().setBool(StorageKey.onboardingComplete, true);
    if(!context.mounted) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) {
          return LoginScreen();
        },
      ),
    );
    notifyListeners();
  }
}
