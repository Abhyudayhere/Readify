import 'package:Readify/commons/widgets/texts/section_heading.dart';
import 'package:Readify/features/library/screens/book_details/widgets/book_attributes.dart';
import 'package:Readify/features/library/screens/book_details/widgets/book_detail_image_slider.dart';
import 'package:Readify/features/library/screens/book_details/widgets/book_meta_data.dart';
import 'package:Readify/features/library/screens/book_details/widgets/bottom_add_to_bookmark.dart';
import 'package:Readify/features/library/screens/book_details/widgets/rating_share_widget.dart';
import 'package:Readify/utils/constants/sizes.dart';
import 'package:Readify/utils/helpers/helper_fuction.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

import '../book_reviews/book_reviews.dart';

class BooksDetailScreen extends StatelessWidget {
  const BooksDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = ReadifyHelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: ReadifyBottomAddToBookmark(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //image slider
            ReadifyBookImageSlider(),
            //book details
            Padding(
              padding: EdgeInsets.only(
                right: ReadifySizes.defaultSpace,
                left: ReadifySizes.defaultSpace,
                bottom: ReadifySizes.defaultSpace,
              ),
              child: Column(
                children: [
                  ///Rating & Reviews
                  ReadifyRatingAndShare(),
                  ///Readify Book MetaData
                  ReadifyBookMetaData(),
                  ///attributes
                  const SizedBox(height: ReadifySizes.spaceBtwItems,),
                  ReadifyBookAttributes(),
                  const SizedBox(height: ReadifySizes.spaceBtwSection,),
                  /// Checkout
                  SizedBox(width: double.infinity ,child: ElevatedButton(onPressed: (){}, child: Text('Checkout'))),
                  const SizedBox(height: ReadifySizes.spaceBtwItems,),
                  ///description
                  const ReadifySectionHeading(title: 'Description' , showActionButton: false,),
                  const SizedBox(height: ReadifySizes.spaceBtwItems,),
                  ReadMoreText(
                    "'I thought of running away with Kamla. When I mentioned it to her, her eyes lit up. She thought it would be great fun. Women in love can be more reckless than men! But I had read too many stories about runaway marriages ending in disaster, and I lacked the courage to go through with such an adventure. I must have known instinctively that it would not work. Where would we go, and how would we live? There would be no home to crawl back to, for either of us.' Seldom do we come across a person who leaves behind an impression on our very being. Call it being enamoured or moved, the memories we shared with them can catch us unawares even years down the line. It is not for the world to decipher what bond we shared and nurtured with them, or how real or surreal it was. This is our secret alone, meant to be kept close to the heart. In The Girl on the Train, we see tales of longing and lost bonds being traced again in Ruskin Bond's simplistic narration. With these stories, you might once again walk down the memory lane of all those cherished moments gone by.",
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' Show more',
                    trimExpandedText: ' Less',
                    moreStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),

                  ///Reviews
                  const Divider(),
                  const SizedBox(height: ReadifySizes.spaceBtwItems,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ReadifySectionHeading(title: 'Reviews(10)', showActionButton: false,),
                      IconButton(onPressed: () => Get.to(() => const BookReviewsScreen()), icon: const Icon(Iconsax.arrow_right_3 , size: 18,), )
                    ],
                  ),
                  const SizedBox(height: ReadifySizes.spaceBtwSection,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

