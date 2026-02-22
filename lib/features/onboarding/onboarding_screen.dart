import 'package:flutter/material.dart';
import 'package:news_app/features/onboarding/controller/onboarding_controller.dart';
import 'package:news_app/features/onboarding/models/onboarding_item.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<OnboardingController>(
      create: (BuildContext context) => OnboardingController(),
      builder: (BuildContext context, _) {
        final controller = context.read<OnboardingController>();
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFFF5F5F5),
            actions: [
              Consumer<OnboardingController>(
                builder:
                    (BuildContext context, OnboardingController value, Widget? child) {
                      return value.isLastPage
                          ? SizedBox()
                          : TextButton(
                              onPressed: () {},
                              child: Text(
                                "Skip",
                                style: TextStyle(fontSize: 16),
                              ),
                            );
                    },
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: controller.pageController,
                    itemCount: OnboardingModel.onboardingList.length,
                    onPageChanged: (index) {
                      controller.onPageChanged(index);
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Image.asset(
                            OnboardingModel.onboardingList[index].imagePath,
                            height: MediaQuery.of(context).size.height * 0.42,
                          ),
                          SizedBox(height: 24),
                          Text(
                            OnboardingModel.onboardingList[index].title,
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFF4E4B66),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 12),
                          Text(
                            OnboardingModel.onboardingList[index].description,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF6E7191),
                              fontWeight: FontWeight.w400,
                            ),
                          ),

                        ],
                      );
                    },
                  ),
                ),

                SmoothPageIndicator(
                  controller: controller.pageController,
                  count: 3,
                  effect: SwapEffect(dotWidth: 14.0, dotHeight: 14.0,),
                ),
                SizedBox(height: 45),
                Consumer<OnboardingController>(
                  builder:
                      (
                        BuildContext context,
                        OnboardingController value,
                        Widget? child,
                      ) {
                        return ElevatedButton(
                          onPressed: () => controller.onNextPage(),
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(
                              MediaQuery.of(context).size.width,
                              52,
                            ),
                          ),
                          child: Text(
                            value.isLastPage ? 'Get Started' : 'Next',
                          ),
                        );
                      },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
