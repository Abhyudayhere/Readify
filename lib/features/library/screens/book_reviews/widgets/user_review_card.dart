import 'package:Readify/commons/widgets/rating_indicator/rating_indicator.dart';
import 'package:Readify/utils/constants/colors.dart';
import 'package:Readify/utils/constants/image_strings.dart';
import 'package:Readify/utils/constants/sizes.dart';
import 'package:Readify/utils/helpers/helper_fuction.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = ReadifyHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
              CircleAvatar(backgroundImage : AssetImage(ReadifyImages.userReview1)),
                const SizedBox(width: ReadifySizes.spaceBtwItems,),
                Text('Abhyuday' , style: Theme.of(context).textTheme.titleLarge,)
              ],
            ),
            IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert)),
          ],
        ),
        const SizedBox(height: ReadifySizes.spaceBtwItems,),

        Row(
          children: [
            ReadifyRatingBarIndicator(rating: 4 , color: Colors.amber,),
            const SizedBox(width: ReadifySizes.spaceBtwItems,),
            Text('01 Mar 2025', style: Theme.of(context).textTheme.bodyMedium,)
          ],
        ),
        const SizedBox(height: ReadifySizes.spaceBtwItems,),
        
        ReadMoreText('The book is a good narration about lost bonds and longings. Which take you back to the memories you cherished.' ,
        trimLines: 2,
        trimMode: TrimMode.Line,
        trimExpandedText: 'Show less',
          trimCollapsedText: 'Show more',
          moreStyle: const TextStyle(fontSize: 14 , fontWeight: FontWeight.bold, color: ReadifyColors.primary),
          lessStyle: const TextStyle(fontSize: 14 , fontWeight: FontWeight.bold, color: ReadifyColors.primary),
        ),
        const SizedBox(height: ReadifySizes.spaceBtwSection,)
      ],
    );
  }
}
