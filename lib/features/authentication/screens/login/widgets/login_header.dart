import 'package:Readify/utils/helpers/helper_fuction.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class ReadifyLoginHeader extends StatelessWidget {
  const ReadifyLoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = ReadifyHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          height: 120,
          image: AssetImage(
              dark ? ReadifyImages.appLogo : ReadifyImages.appLogo),
        ),
        Text(
          ReadifyTexts.loginTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(
          height: ReadifySizes.sm,
        ),
        Text(
          ReadifyTexts.loginSubTitle,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
