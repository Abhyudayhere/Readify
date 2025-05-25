import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';


class ReadifyRatingBarIndicator extends StatelessWidget {
  const ReadifyRatingBarIndicator({
    super.key, required this.rating, this.color = ReadifyColors.primary,
  });

  final Color color;
  final double rating;
  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(itemBuilder: (_,__) => Icon(Iconsax.star1,color: color,), rating: 4.5, itemSize: 20, unratedColor: ReadifyColors.grey,);
  }
}