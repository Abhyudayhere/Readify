import 'package:Readify/commons/widgets/icons/readify_icons_colors.dart';
import 'package:Readify/utils/constants/colors.dart';
import 'package:Readify/utils/constants/sizes.dart';
import 'package:Readify/utils/helpers/helper_fuction.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'add_to_bookmark.dart';

class ReadifyBottomAddToBookmark extends StatelessWidget {
  const ReadifyBottomAddToBookmark({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = ReadifyHelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: ReadifySizes.defaultSpace,
          vertical: ReadifySizes.defaultSpace / 2),
      decoration: BoxDecoration(
          color: dark ? ReadifyColors.darkerGrey : ReadifyColors.light,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(ReadifySizes.cardRadiusLg),
            topLeft: Radius.circular(ReadifySizes.cardRadiusLg),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AddRemoveRow(),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(ReadifySizes.md),
                backgroundColor: ReadifyColors.black,
                side: const BorderSide(color: ReadifyColors.black)),
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
