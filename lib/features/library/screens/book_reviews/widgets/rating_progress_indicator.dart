import 'package:Readify/features/library/screens/book_reviews/widgets/progress_indicator_review.dart';
import 'package:flutter/material.dart';

class ReadifyOverAllRating extends StatelessWidget {
  const ReadifyOverAllRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex : 3 ,child: Text('4.8', style: Theme.of(context).textTheme.displayLarge,)),
        Expanded(
          flex: 7,
          child: Column(
            children: [
              ReadifyRatingProgressIndicator(text: '5', value: 0.8, ),
              ReadifyRatingProgressIndicator(text: '4', value: 0.5, ),
              ReadifyRatingProgressIndicator(text: '3', value: 0.3, ),
              ReadifyRatingProgressIndicator(text: '2', value: 0.1, ),
              ReadifyRatingProgressIndicator(text: '1', value: 0, ),
            ],
          ),
        )
      ],
    );
  }
}