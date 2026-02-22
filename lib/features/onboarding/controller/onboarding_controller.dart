import 'package:flutter/cupertino.dart';

class OnboardingController extends ChangeNotifier{
  final PageController pageController = PageController();

  int currentIndex = 0;
  bool isLastPage = false;

  void onPageChanged(int index){
    currentIndex = index;
    index == 2 ? isLastPage = true : isLastPage = false;
    notifyListeners();
  }

  void onNextPage(){
    pageController.nextPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
     notifyListeners();
  }
}