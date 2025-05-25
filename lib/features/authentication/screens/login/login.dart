import 'package:Readify/commons/styles/spacing_styles.dart';
import 'package:Readify/features/authentication/screens/login/widgets/login_form.dart';
import 'package:Readify/features/authentication/screens/login/widgets/login_header.dart';
import 'package:Readify/utils/constants/sizes.dart';
import 'package:Readify/utils/constants/text_strings.dart';
import 'package:Readify/utils/helpers/helper_fuction.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../commons/widgets/login_signup/form_divider.dart';
import '../../../../commons/widgets/login_signup/social_buttons.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = ReadifyHelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: ReadifySpacingStyle.paddingWithAppBarHeight,
        child: Column(
          children: [
            ///header
            ReadifyLoginHeader(),

            ///form
            const ReadifyLoginForm(),

            ///divider
            ReadifyFormDivider(
              dividerText: ReadifyTexts.orSignInWith.capitalize!,
            ),
            const SizedBox(
              height: ReadifySizes.spaceBtwSection,
            ),

            ///footer
            const ReadifySocialButtons(),
          ],
        ),
      )),
    );
  }
}
