import 'package:flutter/material.dart';
import 'package:news_app/core/constants/app_sizes.dart';
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
                    (
                      BuildContext context,
                      OnboardingController value,
                      Widget? child,
                    ) {
                      return value.isLastPage
                          ? SizedBox()
                          : TextButton(
                              onPressed: () => controller.onFinish(context),
                              child: Text(
                                "Skip",
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                            );
                    },
              ),
            ],
          ),
          body: Padding(
            padding: EdgeInsets.all(AppSizes.pw16),
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
                          SizedBox(height: AppSizes.ph24),
                          Text(
                            OnboardingModel.onboardingList[index].title,
                            style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Color(0xFF4E4B66)),
                          ),
                          SizedBox(height: AppSizes.ph12),
                          Text(
                            OnboardingModel.onboardingList[index].description,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Color(0xFF6E7191),)
                          ),
                        ],
                      );
                    },
                  ),
                ),
                SmoothPageIndicator(
                  controller: controller.pageController,
                  count: 3,
                  effect: SwapEffect(dotWidth: AppSizes.w14, dotHeight: AppSizes.w14),
                ),
                SizedBox(height: AppSizes.ph45),
                Consumer<OnboardingController>(
                  builder:
                      (
                        BuildContext context,
                        OnboardingController value,
                        Widget? child,
                      ) {
                        return ElevatedButton(
                          onPressed: () {
                            if (!value.isLastPage) {
                              controller.onNextPage();
                            } else {
                              controller.onFinish(context);
                            }
                          },
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
