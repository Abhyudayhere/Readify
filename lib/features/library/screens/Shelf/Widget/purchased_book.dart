import 'package:flutter/material.dart';

import '../../../../../commons/widgets/icons/readify_author_title_with_author_icon.dart';
import '../../../../../commons/widgets/images/readify_rounded_images.dart';
import '../../../../../commons/widgets/texts/book_title_text.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_fuction.dart';

class PurchasedBook extends StatelessWidget {
  const PurchasedBook({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ReadifyRoundedImage(
          imageUrl: ReadifyImages.book1,
          width: 100,
          height: 100,
          padding: EdgeInsets.all(ReadifySizes.sm),
          backgroundColor: ReadifyHelperFunctions.isDarkMode(context) ? ReadifyColors.darkerGrey : ReadifyColors.light,
        ),
        const SizedBox(width: ReadifySizes.spaceBtwItems),

        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ReadifyAuthorTitleWithAuthorIcon(title: 'Ruskin Bond'),
              Flexible(child: ReadifyBookTitleText(title: 'The Girl on the Train', maxLines: 1)),

              Text.rich(
                TextSpan(
                  children: [
                    WidgetSpan(
                      child: Icon(Icons.book, size: 16, color: Colors.grey),
                      alignment: PlaceholderAlignment.middle,
                    ),

                    WidgetSpan(
                      child: Padding(
                        padding: const EdgeInsets.all(ReadifySizes.sm),
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size(0, 0),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: Text(
                            'Read',
                            style: Theme.of(context).textTheme.bodyLarge!.apply(color: ReadifyColors.primary),
                          ),
                        ),
                      ),
                      alignment: PlaceholderAlignment.middle,
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
