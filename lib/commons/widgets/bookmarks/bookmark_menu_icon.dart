import 'package:Readify/features/library/screens/bookmark/bookmark.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper_fuction.dart';

class ReadifyBookmarkCounterIcon extends StatelessWidget {
  const ReadifyBookmarkCounterIcon({
    super.key,
    required this.iconColor,
  });
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
            onPressed: () => Get.to(() => const BookmarkScreen()),
            icon: Icon(
              Iconsax.bookmark,
              color: iconColor,
            )),
        Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
                color: (ReadifyHelperFunctions.isDarkMode(context)
                    ? ReadifyColors.white
                    : ReadifyColors.black
                ).withAlpha((0.5 * 255).toInt()),
                borderRadius: BorderRadius.circular(100)),
            child: Center(
              child: Text(
                '7',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: ReadifyColors.white, fontSizeFactor: 0.8),
              ),
            ),
          ),
        )
      ],
    );
  }
}
