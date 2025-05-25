import 'package:Readify/utils/helpers/helper_fuction.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/devices/device_utility.dart';
import '../../../controllers/onboarding/onboarding_controller.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = ReadifyHelperFunctions.isDarkMode(context);
    return Positioned(
      top: ReadifyDeviceUtils.getAppBarHeight(),
      right: ReadifySizes.defaultSpace,
      child: TextButton(
          onPressed: () => OnBoardingController.instance.skipPage(),
          child: Text('Skip' , style: TextStyle(  color: dark ? Colors.white : Colors.black,),)),
    );
  }
}
