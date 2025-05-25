import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_fuction.dart';
import '../icons/readify_author_title_with_author_icon.dart';
import '../images/readify_rounded_images.dart';
import '../texts/book_title_text.dart';


class ReadifyBookmarkItem extends StatelessWidget {
  const ReadifyBookmarkItem({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ReadifyRoundedImage(
          imageUrl: ReadifyImages.book1,
          width: 60,
          height: 60,
          padding: EdgeInsets.all(ReadifySizes.sm),
          backgroundColor: ReadifyHelperFunctions.isDarkMode(context) ? ReadifyColors.darkerGrey : ReadifyColors.light,
        ),
        const SizedBox(width: ReadifySizes.spaceBtwItems,),

        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ReadifyAuthorTitleWithAuthorIcon(title: 'Ruskin Bond'),
              Flexible(child: ReadifyBookTitleText(title: 'The Girl on the Train' , maxLines: 1,)),

              Text.rich(
                TextSpan(
                  children: [
                    WidgetSpan(child: Icon(Icons.language, size: 16, color: Colors.grey), alignment: PlaceholderAlignment.middle,),
                    TextSpan(text: ' EN ', style: Theme.of(context).textTheme.bodyLarge,),
                    WidgetSpan(child: Icon(Icons.hourglass_bottom, size: 16 , color: Colors.grey), alignment: PlaceholderAlignment.middle,),
                    TextSpan(text: ' 3-Days', style: Theme.of(context).textTheme.bodyLarge,),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}