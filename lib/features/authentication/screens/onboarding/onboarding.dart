import 'package:Readify/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:Readify/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:Readify/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:Readify/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:Readify/utils/constants/image_strings.dart';
import 'package:Readify/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/onboarding/onboarding_controller.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: ReadifyImages.onBoardingImage1,
                title: ReadifyTexts.onBoardingTitle1,
                subtitle: ReadifyTexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: ReadifyImages.onBoardingImage2,
                title: ReadifyTexts.onBoardingTitle2,
                subtitle: ReadifyTexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: ReadifyImages.onBoardingImage3,
                title: ReadifyTexts.onBoardingTitle3,
                subtitle: ReadifyTexts.onBoardingSubTitle3,
              ),
            ],
          ),

          //skip//
          const OnBoardingSkip(),
          //dot navigation//
          const OnBoardingDotNavigation(),
          //next button//
          const OnBoardingNextButton(),
        ],
      ),
    );
  }
}
