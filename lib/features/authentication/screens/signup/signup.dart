import 'package:Readify/commons/widgets/login_signup/form_divider.dart';
import 'package:Readify/commons/widgets/login_signup/social_buttons.dart';
import 'package:Readify/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:Readify/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/sizes.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ReadifySizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// title
              Text(
                ReadifyTexts.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: ReadifySizes.spaceBtwSection,
              ),

              ///form
              const ReadifySignupWidget(),

              ///Divider
              const SizedBox(
                height: ReadifySizes.spaceBtwSection,
              ),
              ReadifyFormDivider(
                  dividerText: ReadifyTexts.orSignUpWith.capitalize!),

              ///Social buttons
              const SizedBox(
                height: ReadifySizes.spaceBtwSection,
              ),
              const ReadifySocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
