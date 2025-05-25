import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_fuction.dart';
import '../../../controllers/signup/signup_controller.dart';

class ReadifyTermsandConditionsCheckbox extends StatelessWidget {
  const ReadifyTermsandConditionsCheckbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    final dark = ReadifyHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        SizedBox(
            width: 24,
            height: 24,
            child: Obx(() => Checkbox(value: controller.privacyPolicy.value, onChanged: (value) => controller.privacyPolicy.value = !controller.privacyPolicy.value))),
        const SizedBox(
          width: ReadifySizes.spaceBtwItems,
        ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                  text: '${ReadifyTexts.iAgreeTo} ',
                  style: Theme.of(context).textTheme.bodySmall),
              TextSpan(
                text: '${ReadifyTexts.privacyPolicy} ',
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                      color: dark ? ReadifyColors.white : ReadifyColors.primary,
                      decoration: TextDecoration.underline,
                    ),
              ),
              TextSpan(
                  text: ' ${ReadifyTexts.and} ',
                  style: Theme.of(context).textTheme.bodySmall),
              TextSpan(
                text: ReadifyTexts.termsOfUse,
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                      color: dark ? ReadifyColors.white : ReadifyColors.primary,
                      decoration: TextDecoration.underline,
                      decorationColor:
                          dark ? ReadifyColors.white : ReadifyColors.primary,
                    ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
