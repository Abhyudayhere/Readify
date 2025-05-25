import 'package:Readify/features/library/screens/bookmark/widget/bookmark_item.dart';
import 'package:Readify/features/personalization/controllers/update_name_controller.dart';
import 'package:Readify/utils/constants/sizes.dart';
import 'package:Readify/utils/helpers/helper_fuction.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../commons/widgets/appbar/appbar.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/validators/validation.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    final dark = ReadifyHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: ReadifyAppBar(
        title: Text(
          'Change Name',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ReadifySizes.defaultSpace),
          child: Form(
            key: controller.updateUserNameFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Instruction Text
                Text(
                  "Enter your real first and last name as it appears on several pages.",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: ReadifySizes.spaceBtwItems),

                /// First Name
                TextFormField(
                  controller: controller.firstName,
                  validator: (value) => ReadifyValidator.validateEmptyText('First Name', value),
                  decoration: const InputDecoration(
                    labelText: ReadifyTexts.firstName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
                const SizedBox(height: ReadifySizes.spaceBtwInputFields),

                /// Last Name
                TextFormField(
                  controller: controller.lastName,
                  validator: (value) => ReadifyValidator.validateEmptyText('Last Name', value),
                  decoration: const InputDecoration(
                    labelText: ReadifyTexts.lastName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
                const SizedBox(height: ReadifySizes.spaceBtwSection),

                /// Continue Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => controller.updateUserName(),
                    child: const Text(ReadifyTexts.continueButton),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
