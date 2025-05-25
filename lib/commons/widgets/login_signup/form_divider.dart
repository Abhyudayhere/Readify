import 'package:Readify/utils/helpers/helper_fuction.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class ReadifyFormDivider extends StatelessWidget {
  const ReadifyFormDivider({
    super.key,
    required this.dividerText,
  });

  final String dividerText;

  @override
  Widget build(BuildContext context) {
    final dark = ReadifyHelperFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
            child: Divider(
          color: dark ? ReadifyColors.darkGrey : ReadifyColors.grey,
          thickness: 0.5,
          indent: 60,
          endIndent: 5,
        )),
        Text(
          dividerText,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Flexible(
            child: Divider(
          color: dark ? ReadifyColors.darkGrey : ReadifyColors.grey,
          thickness: 0.5,
          indent: 5,
          endIndent: 60,
        )),
      ],
    );
  }
}
