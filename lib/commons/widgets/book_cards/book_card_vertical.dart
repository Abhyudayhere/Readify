import 'package:Readify/commons/widgets/book_cards/star_icon.dart';
import 'package:Readify/commons/widgets/images/readify_rounded_images.dart';
import 'package:Readify/commons/widgets/texts/book_title_text.dart';
import 'package:Readify/features/library/screens/book_details/book_details.dart';
import 'package:Readify/utils/constants/colors.dart';
import 'package:Readify/utils/constants/image_strings.dart';
import 'package:Readify/utils/constants/sizes.dart';
import 'package:Readify/utils/helpers/helper_fuction.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../styles/shadows.dart';
import '../custom_shapes/containers/rounded_container.dart';
import '../icons/readify_author_title_with_author_icon.dart';
import '../texts/book_price_text.dart';
import 'add_to_cart_togglebutton.dart';

class ReadifyBookCardVertical extends StatelessWidget {
  const ReadifyBookCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = ReadifyHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () => Get.to(() => const BooksDetailScreen()),
      child: Container(
        width: 180,
        padding: EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [ReadifyShadowStyle.verticalBookShadow],
          borderRadius: BorderRadius.circular(ReadifySizes.bookImageRadius),
          color: dark ? ReadifyColors.darkerGrey : ReadifyColors.white,
        ),
        child: Column(
          children: [
            ///thumbnail
            ReadifyRoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(ReadifySizes.sm),
              backgroundColor: dark ? ReadifyColors.dark : ReadifyColors.light,
              child: Stack(
                children: [
                  ///Thumbnail Image
                  const ReadifyRoundedImage(
                    imageUrl: ReadifyImages.book1,
                    applyImageRadius: true,
                  ),

                  Stack(
                    children: [
                      ///sale Tag
                      Positioned(
                        top: 12,
                        child: ReadifyRoundedContainer(
                          radius: ReadifySizes.sm,
                          backgroundColor: ReadifyColors.secondary.withAlpha((0.8 * 255).toInt()),
                          padding: EdgeInsets.symmetric(horizontal: ReadifySizes.sm, vertical: ReadifySizes.xs),
                          child: Text('25%', style: Theme.of(context).textTheme.labelLarge!.apply(color: ReadifyColors.black),),
                        ),
                      ),

                      ///Star Icon Button
                      Positioned(
                        top: 0,
                        right: 2,
                        child: ToggleStarIcon(size: ReadifySizes.lg * 0.8),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: ReadifySizes.spaceBtwItems /2,),

            ///-- Details

            Padding(
              padding: const EdgeInsets.only(left: ReadifySizes.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReadifyBookTitleText(title: 'The Girl on the Train ', smallSize: true,),
                  const SizedBox(height: ReadifySizes.spaceBtwItems /2,),
                  ReadifyAuthorTitleWithAuthorIcon(title: 'Ruskin Bond',),
                ],
              ),
            ),
            const Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ///price
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: ReadifySizes.sm),
                    child: ReadifyBookPriceText(price: '9.0', isLarge: true),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: ReadifyColors.dark,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(ReadifySizes.cardRadiusMd),
                      bottomRight: Radius.circular(ReadifySizes.bookImageRadius),
                    ),
                  ),
                  child: SizedBox(
                    width: ReadifySizes.iconLg * 1.2,
                    height: ReadifySizes.iconLg * 1.2,
                    child: Center(
                      child: ToggleIconButton(),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}