import 'package:Readify/features/authentication/screens/signup/verify_email.dart';
import 'package:Readify/features/authentication/screens/signup/widgets/terms_condition_checkbox.dart';
import 'package:Readify/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_fuction.dart';
import '../../../controllers/signup/signup_controller.dart';

class ReadifySignupWidget extends StatelessWidget {
  const ReadifySignupWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    final dark = ReadifyHelperFunctions.isDarkMode(context);
    return Form(
      key : controller.signupFormKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) => ReadifyValidator.validateEmptyText('First Name', value),
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: ReadifyTexts.firstName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
              const SizedBox(
                width: ReadifySizes.spaceBtwInputFields,
              ),
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                  validator: (value) => ReadifyValidator.validateEmptyText('Last Name', value),
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: ReadifyTexts.lastName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
            ],
          ),

          ///User Name
          const SizedBox(
            height: ReadifySizes.spaceBtwInputFields,
          ),
          TextFormField(
            controller: controller.userName,
            validator: (value) => ReadifyValidator.validateEmptyText('Username', value),
            expands: false,
            decoration: const InputDecoration(
              labelText: ReadifyTexts.userName,
              prefixIcon: Icon(Iconsax.user_edit),
            ),
          ),
          const SizedBox(
            height: ReadifySizes.spaceBtwInputFields,
          ),

          ///email
          TextFormField(
            controller: controller.email,
            validator: (value) => ReadifyValidator.validateEmail(value),
            expands: false,
            decoration: const InputDecoration(
              labelText: ReadifyTexts.email,
              prefixIcon: Icon(Iconsax.direct),
            ),
          ),
          const SizedBox(
            height: ReadifySizes.spaceBtwInputFields,
          ),

          ///phone Number
          TextFormField(
            controller: controller.phoneNumber,
            validator: (value) => ReadifyValidator.validatePhoneNumber(value),
            expands: false,
            decoration: const InputDecoration(
              labelText: ReadifyTexts.phoneNo,
              prefixIcon: Icon(Iconsax.call),
            ),
          ),
          const SizedBox(
            height: ReadifySizes.spaceBtwInputFields,
          ),

          ///password
          Obx(
            ()=>TextFormField(
              validator: (value) => ReadifyValidator.validatePassword(value),
              controller: controller.password,
              obscureText: controller.hidePassword.value,
              decoration: InputDecoration(
                labelText: ReadifyTexts.password,
                prefixIcon: Icon(Iconsax.password_check),
                suffixIcon: IconButton(
                  onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                    icon : Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: ReadifySizes.spaceBtwSection,
          ),

          ///terms and condition check box
          const ReadifyTermsandConditionsCheckbox(),
          const SizedBox(
            height: ReadifySizes.spaceBtwSection,
          ),

          ///Sign Up button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => controller.signup(),
              child: const Text(ReadifyTexts.createAccount),
            ),
          )
        ],
      ),
    );
  }
}
