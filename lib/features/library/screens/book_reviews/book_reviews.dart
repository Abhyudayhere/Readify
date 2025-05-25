import 'package:Readify/commons/widgets/appbar/appbar.dart';
import 'package:Readify/features/library/screens/book_reviews/widgets/rating_progress_indicator.dart';
import 'package:Readify/features/library/screens/book_reviews/widgets/user_review_card.dart';
import 'package:Readify/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../commons/widgets/rating_indicator/rating_indicator.dart';

class BookReviewsScreen extends StatelessWidget {
  const BookReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReadifyAppBar(
        title: (Text('Reviews & Ratings')),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(ReadifySizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Customers find the book easy to read with engaging stories. They appreciate the imagination and storytelling style. The writing touches their hearts and makes them feel connected.'),
              SizedBox(
                height: ReadifySizes.spaceBtwItems,
              ),
              SizedBox(
                height: ReadifySizes.spaceBtwItems,
              ),

              ///over all rating
              ReadifyOverAllRating(),
              ReadifyRatingBarIndicator(
                rating: 4.8,
              ),
              Row(
                children: [
                  Text('Reviews :', style: Theme.of(context).textTheme.bodySmall,),
                  const SizedBox(width: ReadifySizes.spaceBtwItems,),
                  Text('13', style: Theme.of(context).textTheme.bodyMedium,),
                ],
              ),
              const SizedBox(height: ReadifySizes.spaceBtwSection,),

              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}
