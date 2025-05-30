import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_fuction.dart';


class ReadifyVerticalImageText extends StatelessWidget {
  const ReadifyVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = ReadifyColors.white,
    this.backgroundColor = ReadifyColors.white,
    this.onTap,
  });

  final String image,title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = ReadifyHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: ReadifySizes.spaceBtwItems),
        child: Column(
          children: [
            Container(
              width: 56,
              height: 56,
              padding: const EdgeInsets.all(ReadifySizes.sm),
              decoration: BoxDecoration(
                  color: backgroundColor?? (dark ? ReadifyColors.black : ReadifyColors.white),
                  borderRadius: BorderRadius.circular(100)
              ),
              child: Center(
                child: Image(image: AssetImage(image), fit: BoxFit.cover,),
              ),
            ),
            ///text
            const SizedBox(height: ReadifySizes.spaceBtwItems / 2,),
            SizedBox(width: 55,child: Text(title, style: Theme.of(context).textTheme.labelMedium!.apply(color: textColor),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,))
          ],
        ),
      ),
    );
  }
}