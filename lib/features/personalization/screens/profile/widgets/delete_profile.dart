import 'package:Readify/features/personalization/controllers/update_name_controller.dart';
import 'package:Readify/features/personalization/controllers/user_controller.dart';
import 'package:Readify/utils/constants/sizes.dart';
import 'package:Readify/utils/helpers/helper_fuction.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../commons/widgets/appbar/appbar.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/validators/validation.dart';

class DeleteProfile extends StatelessWidget {
  const DeleteProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    final dark = ReadifyHelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: ReadifyAppBar(
        title: Text(
          'Delete Profile',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ReadifySizes.defaultSpace),
          child: Form(
            key: controller.reAuthFormKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: ReadifySizes.spaceBtwSection),
              child: Column(
                children: [
                  // Email field
                  TextFormField(
                    controller: controller.verifyEmail,
                    validator: (value) => ReadifyValidator.validateEmail(value),
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.direct_right),
                      labelText: ReadifyTexts.email,
                    ),
                  ),
                  const SizedBox(height: ReadifySizes.spaceBtwInputFields),

                  // Password field
                  Obx(
                        () => TextFormField(
                      validator: (value) => ReadifyValidator.validateEmptyText('password', value),
                      controller: controller.verifyPassword,
                      obscureText: controller.hidePassword.value,
                      decoration: InputDecoration(
                        labelText: ReadifyTexts.password,
                        prefixIcon: const Icon(Iconsax.password_check),
                        suffixIcon: IconButton(
                          onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                          icon: Icon(
                            controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: ReadifySizes.spaceBtwSection),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => controller.reAuthenticationEmailAndPasswordUser(),
                      child: const Text('Verify'),
                    ),
                  ),
                  const SizedBox(height: ReadifySizes.spaceBtwItems),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
