import 'package:Readify/commons/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:Readify/commons/widgets/texts/section_heading.dart';
import 'package:Readify/utils/constants/colors.dart';
import 'package:Readify/utils/constants/image_strings.dart';
import 'package:Readify/utils/constants/sizes.dart';
import 'package:Readify/utils/helpers/helper_fuction.dart';
import 'package:flutter/material.dart';

class ReadifyPaymentOption extends StatelessWidget {
  const ReadifyPaymentOption({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = ReadifyHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        ReadifySectionHeading(title: 'Payment Method', buttonTitle: 'Change', onPressed: (){},),
        const SizedBox(height: ReadifySizes.spaceBtwItems /2,),
        Row(
          children: [
            ReadifyRoundedContainer(
              width: 60,
              height: 35,
              backgroundColor: dark ? ReadifyColors.light : ReadifyColors.white,
              padding: const EdgeInsets.all(ReadifySizes.sm),
              child: const Image(image: AssetImage(ReadifyImages.upiImage),fit: BoxFit.contain,),
            ),
            const SizedBox(width: ReadifySizes.spaceBtwItems /2,),
            Text('UPI', style: Theme.of(context).textTheme.bodyLarge,)
          ],
        )
      ],
    );
  }
}
