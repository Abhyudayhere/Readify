import 'package:Readify/features/authentication/controllers/login/login_controller.dart';
import 'package:Readify/features/authentication/screens/password_configuration/forgot_password.dart';
import 'package:Readify/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../signup/signup.dart';

class ReadifyLoginForm extends StatelessWidget {
  const ReadifyLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding:
            const EdgeInsets.symmetric(vertical: ReadifySizes.spaceBtwSection),
        child: Column(
          children: [
            //email
            TextFormField(
              controller: controller.email,
              validator: (value) => ReadifyValidator.validateEmail(value),
              decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: ReadifyTexts.email,
              ),
            ),
            const SizedBox(height: ReadifySizes.spaceBtwInputFields),
            //password
            Obx(
                  ()=>TextFormField(
                validator: (value) => ReadifyValidator.validateEmptyText('password',value),
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
            const SizedBox(height: ReadifySizes.spaceBtwInputFields / 2),
            //remember me & forgot password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ///remember me
                Row(
                  children: [
                Obx(() => Checkbox(value: controller.rememberMe.value, onChanged: (value) => controller.rememberMe.value = !controller.rememberMe.value)),
                    const Text(ReadifyTexts.rememberMe),
                  ],
                ),

                ///forget password
                TextButton(
                  onPressed: () => Get.to(() => const ForgotPassword()),
                  child: const Text(ReadifyTexts.forgotPassword),
                )
              ],
            ),
            const SizedBox(
              height: ReadifySizes.spaceBtwSection,
            ),

            ///sign in button
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => controller.emailAndPasswordSignIn(),
                    child: Text(ReadifyTexts.signIn))),
            const SizedBox(
              height: ReadifySizes.spaceBtwItems,
            ),

            ///create account button
            SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    onPressed: () => Get.to(() => const SignupScreen()),
                    child: Text(ReadifyTexts.createAccount))),
          ],
        ),
      ),
    );
  }
}
