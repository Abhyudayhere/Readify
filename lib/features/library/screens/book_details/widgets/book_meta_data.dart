import 'package:Readify/commons/widgets/icons/readify_author_title_with_author_icon.dart';
import 'package:Readify/commons/widgets/images/author_rounded_image.dart';
import 'package:Readify/commons/widgets/texts/book_price_text.dart';
import 'package:Readify/commons/widgets/texts/book_title_text.dart';
import 'package:Readify/utils/constants/enums.dart';
import 'package:Readify/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';

import '../../../../../commons/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class ReadifyBookMetaData extends StatelessWidget {
  const ReadifyBookMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            ///Sale Tag
                 ReadifyRoundedContainer(
                radius: ReadifySizes.sm,
                backgroundColor: ReadifyColors.secondary.withAlpha((0.8 * 255).toInt()),
                padding: EdgeInsets.symmetric(horizontal: ReadifySizes.sm, vertical: ReadifySizes.xs),
                child: Text('100%', style: Theme.of(context).textTheme.labelLarge!.apply(color: ReadifyColors.black),),
              ),
              const SizedBox(width: ReadifySizes.spaceBtwItems,),
            ///Price
            Text('₹9.0/-' , style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough)),
            const SizedBox(width: ReadifySizes.spaceBtwItems,),
            const ReadifyBookPriceText(price: 'Free ' , text: '/3-Days', isLarge: true, fontSize: 15,)
          ],
        ),
        const SizedBox(height: ReadifySizes.spaceBtwItems / 1.5,),

        ///Title
        Row(
          children: [
            const ReadifyBookTitleText(title: 'Title :'),
            const SizedBox(width: ReadifySizes.spaceBtwItems,),
            Text('	THE GIRL ON THE TRAIN', style: Theme.of(context).textTheme.titleMedium,),
          ],
        ),
        const SizedBox(height: ReadifySizes.spaceBtwItems / 1.5,),

        ///Number of pages
        Row(
          children: [
            const ReadifyBookTitleText(title: 'Number Of Pages :'),
            const SizedBox(width: ReadifySizes.spaceBtwItems,),
            Text('144', style: Theme.of(context).textTheme.titleMedium,),
          ],
        ),
        const SizedBox(height: ReadifySizes.spaceBtwItems / 1.5,),
        ///Publisher
        Row(
          children: [
            const ReadifyBookTitleText(title: 'Publisher:'),
            const SizedBox(width: ReadifySizes.spaceBtwItems,),
            Text('Rupa Publications India', style: Theme.of(context).textTheme.titleMedium,),
          ],
        ),
        const SizedBox(height: ReadifySizes.spaceBtwItems / 1.5,),
        /// author
        Row(
          children: [
            ReadifyAuthorCircularImage(image: ReadifyImages.author1,size: 32,),
            const SizedBox(width: ReadifySizes.spaceBtwItems,),
            ReadifyAuthorTitleWithAuthorIcon(title: 'Ruskin Bond' , authorTextSize: TextSizes.medium,),
          ],
        )


      ],
    );
  }
}
