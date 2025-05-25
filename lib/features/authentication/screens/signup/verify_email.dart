import 'package:Readify/data/repositories/authentication/authentication_repository.dart';
import 'package:Readify/features/authentication/controllers/signup/verify_email_controller.dart';
import 'package:Readify/features/authentication/screens/login/login.dart';
import 'package:Readify/utils/constants/text_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_fuction.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => AuthenticationRepository.instance.logout(),
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
                image: AssetImage(ReadifyImages.deliveredImage),
                width: ReadifyHelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(
                height: ReadifySizes.spaceBtwSection,
              ),

              /// title & subtitle
              Text(
                ReadifyTexts.confirmEmail,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: ReadifySizes.spaceBtwItems,
              ),
              Text(
                email??'',
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: ReadifySizes.spaceBtwItems,
              ),
              Text(
                ReadifyTexts.confirmEmailSubTitle,
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
                  onPressed: () => controller.checkEmailVerificationStatus(),
                  child: const Text(ReadifyTexts.continueButton),
                ),
              ),
              const SizedBox(
                height: ReadifySizes.spaceBtwItems,
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () => controller.sendEmailVerification(),
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
