import 'package:Readify/commons/styles/spacing_styles.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/text_strings.dart';
import '../../../utils/helpers/helper_fuction.dart';

class SucessScreen extends StatelessWidget {
  const SucessScreen({super.key, required this.image, required this.title, required this.subTitle, required this.onPressed});

  final String image, title, subTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(padding: ReadifySpacingStyle.paddingWithAppBarHeight * 2,
          child: Column(
            children: [
            /// image
          Lottie.asset(image, width: MediaQuery.of(context).size.width* 0.6),
            const SizedBox(
              height: ReadifySizes.spaceBtwSection,
            ),

            /// title & subtitle
            Text(
              title,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: ReadifySizes.spaceBtwItems,
            ),
            Text(
              subTitle,
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
                onPressed: onPressed,
                child: const Text(ReadifyTexts.continueButton),
              ),
            ),
          ],
          ),
      ),
    )
    );
  }
}
