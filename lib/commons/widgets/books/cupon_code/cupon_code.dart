import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_fuction.dart';
import '../../custom_shapes/containers/rounded_container.dart';


class ReadifyCuponCode extends StatelessWidget {
  const ReadifyCuponCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = ReadifyHelperFunctions.isDarkMode(context);
    return ReadifyRoundedContainer(
      showBorder: true,
      backgroundColor: dark ? ReadifyColors.dark : ReadifyColors.white,
      padding: const EdgeInsets.only(top: ReadifySizes.sm,bottom: ReadifySizes.sm,right: ReadifySizes.sm,left: ReadifySizes.md),
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Have a promo code ? Enter here',
                focusedBorder: InputBorder.none,
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),

          SizedBox(width: 80,
              child: ElevatedButton(onPressed: (){},
                  style: ElevatedButton.styleFrom(
                      foregroundColor: dark ? ReadifyColors.white.withAlpha((0.5 * 255).toInt()) : ReadifyColors.dark.withAlpha((0.5 * 255).toInt()), backgroundColor: ReadifyColors.grey.withAlpha((0.2 * 255).toInt()), side: BorderSide(color: ReadifyColors.grey.withAlpha((0.1 * 255).toInt()))
                  ),
                  child: Text('Apply')))
        ],
      ),

    );
  }
}