import 'package:Readify/commons/widgets/texts/section_heading.dart';
import 'package:Readify/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../personalization/controllers/user_controller.dart';

class ReadifyBillingDetails extends StatelessWidget {
  const ReadifyBillingDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ReadifySectionHeading(title: 'Billing To', buttonTitle: 'Change', onPressed: (){},),
        Text(controller.user.value.fullName, style: Theme.of(context).textTheme.bodyLarge,),

        const SizedBox(height: ReadifySizes.spaceBtwItems /2,),
        Row(
          children: [
            const Icon(Icons.phone, color: Colors.grey, size: 16,),
            const SizedBox(width: ReadifySizes.spaceBtwItems,),
            Text(controller.user.value.phoneNumber , style: Theme.of(context).textTheme.bodyMedium,),
          ],
        ),
        const SizedBox(height: ReadifySizes.spaceBtwItems /2,),

        Row(
          children: [
            const Icon(Icons.mail, color: Colors.grey, size: 16,),
            const SizedBox(width: ReadifySizes.spaceBtwItems,),
            Text(controller.user.value.email , style: Theme.of(context).textTheme.bodyMedium,),
          ],
        ),
      ],
    );
  }
}
