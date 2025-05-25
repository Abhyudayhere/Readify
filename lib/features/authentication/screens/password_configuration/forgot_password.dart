import 'package:Readify/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:Readify/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:Readify/utils/constants/text_strings.dart';
import 'package:Readify/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/sizes.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(ReadifySizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //heading
            Text(
              ReadifyTexts.forgotPasswordTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(
              height: ReadifySizes.spaceBtwItems,
            ),
            Text(
              ReadifyTexts.forgotPasswordSubTitle,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(
              height: ReadifySizes.spaceBtwSection * 2,
            ),
            //text fields
            Form(
              key: controller.forgetPasswordFormKey,
              child: TextFormField(
                controller: controller.email,
                validator: ReadifyValidator.validateEmail,
                decoration: const InputDecoration(
                    labelText: ReadifyTexts.email,
                    prefixIcon: Icon(Iconsax.direct_right)),
              ),
            ),
            const SizedBox(
              height: ReadifySizes.spaceBtwSection,
            ),
            //submitbutton
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => controller.sendPasswordResetEmail(),
                    child: Text(ReadifyTexts.submit)))
          ],
        ),
      ),
    );
  }
}
