import 'package:flutter/material.dart';
import 'package:news_app/core/constants/app_sizes.dart';
import 'package:news_app/core/services/theme_controller.dart';
import 'package:news_app/core/theme/light_colors.dart';
import 'package:news_app/features/onboarding/controller/onboarding_controller.dart';
import 'package:news_app/features/onboarding/models/onboarding_item.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ChangeNotifierProvider<OnboardingController>(
      create: (BuildContext context) => OnboardingController(),
      builder: (BuildContext context, _) {
        final controller = context.read<OnboardingController>();
        return Scaffold(
          appBar: AppBar(
            // backgroundColor: Color(0xFFF5F5F5),
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
                                style: theme.textTheme.titleSmall,
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
                            style: theme.textTheme.titleMedium!
                                .copyWith(
                                  color: theme.colorScheme.onSurface,
                                ),
                          ),
                          SizedBox(height: AppSizes.ph12),
                          Text(
                            OnboardingModel.onboardingList[index].description,
                            textAlign: TextAlign.center,
                            style: theme.textTheme.titleSmall!
                                .copyWith(
                                  color: theme.colorScheme.surface,
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
                  effect: SwapEffect(
                    dotWidth: AppSizes.w14,
                    dotHeight: AppSizes.w14,
                  ),
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
