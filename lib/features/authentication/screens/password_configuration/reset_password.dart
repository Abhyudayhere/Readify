import 'package:Readify/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:Readify/features/authentication/screens/login/login.dart';
import 'package:Readify/utils/constants/text_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_fuction.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ReadifySizes.defaultSpace),
          child: Column(
            children: [
              /// image
              Image(
                image: const AssetImage(ReadifyImages.deliveredImage),
                width: ReadifyHelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(
                height: ReadifySizes.spaceBtwSection,
              ),

              /// title & subtitle
              Text(
                email,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: ReadifySizes.spaceBtwItems,),
              Text(
                ReadifyTexts.changeYourPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: ReadifySizes.spaceBtwItems,
              ),
              Text(
                ReadifyTexts.changeYourPasswordSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: ReadifySizes.spaceBtwSection,
              ),

              /// buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.offAll(() => const LoginScreen()),
                  child: const Text(ReadifyTexts.done),
                ),
              ),
              const SizedBox(
                height: ReadifySizes.spaceBtwItems,
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () => ForgetPasswordController.instance.resendPasswordResetEmail(email) ,
                  child: const Text(ReadifyTexts.resendEmail),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
