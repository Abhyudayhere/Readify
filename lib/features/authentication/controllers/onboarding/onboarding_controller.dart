import 'package:Readify/features/authentication/screens/login/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  final deviceStorage = GetStorage();

//update current index when page scroll
  void updatePageIndicator(index) => currentPageIndex.value = index;

  // jump to the specific page
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }

  //update current index & jump to next page
  void nextPage() {
    if (currentPageIndex.value == 2) {
      final storage = GetStorage();

      if (kDebugMode){
        print("================ Storage =============");
        print(deviceStorage.read('IsFirstTime'));
      }

      storage.write('IsFirstTime', false);

      if (kDebugMode){
        print("================ Storage =============");
        print(deviceStorage.read('IsFirstTime'));
      }

      Get.offAll(const LoginScreen());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  //update current index & jump to last page
  void skipPage([int index = 2]) {
    currentPageIndex.value = index;
    pageController.jumpToPage(index);
  }
}
