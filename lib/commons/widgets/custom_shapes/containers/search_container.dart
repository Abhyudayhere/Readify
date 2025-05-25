import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/devices/device_utility.dart';
import '../../../../utils/helpers/helper_fuction.dart';

class ReadifySearchContainer extends StatelessWidget {
  const ReadifySearchContainer({
    super.key, required this.text,
    this.icon = Iconsax.search_normal,
    this.showBackground = true ,
    this.showBorder = true,
    this.onTap,
    this.padding = const EdgeInsets.symmetric(horizontal: ReadifySizes.defaultSpace),
  });
  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;
  @override
  Widget build(BuildContext context) {
    final dark = ReadifyHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Container(
          width: ReadifyDeviceUtils.getScreenWidth(context),
          padding: const EdgeInsets.all(ReadifySizes.cardRadiusLg),
          decoration: BoxDecoration(
              color:  showBackground ? dark? ReadifyColors.dark : ReadifyColors.light : Colors.transparent,
              borderRadius: BorderRadius.circular(ReadifySizes.cardRadiusLg),
              border: showBorder ? Border.all(color: ReadifyColors.grey) : null
          ),
          child: Row(
            children: [
              Icon(icon, color: ReadifyColors.darkerGrey,),
              const SizedBox(width: ReadifySizes.spaceBtwItems,),
              Text(text, style: Theme.of(context).textTheme.bodySmall,)
            ],
          ),
        ),
      ),
    );
  }
}
