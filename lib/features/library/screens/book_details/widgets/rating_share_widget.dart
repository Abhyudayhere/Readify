import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../commons/widgets/rating_indicator/rating_indicator.dart';
import '../../../../../utils/constants/sizes.dart';
class ReadifyRatingAndShare extends StatelessWidget {
  const ReadifyRatingAndShare({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment : MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            ReadifyRatingBarIndicator(
              rating: 4.8,
              color: Colors.amber,
            ),
            const SizedBox(
              width: ReadifySizes.spaceBtwItems / 2,
            ),
            Text.rich(TextSpan(children: [
              TextSpan(
                  text: '4.8',
                  style: Theme.of(context).textTheme.bodyLarge),
              const TextSpan(text: '(13)'),
            ]))
          ],
        ),
        ///share Button
        IconButton(onPressed: (){}, icon: const Icon(FontAwesomeIcons.shareFromSquare ,size: ReadifySizes.md,))
      ],
    );
  }
}
