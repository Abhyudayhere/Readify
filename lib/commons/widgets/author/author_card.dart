import 'package:flutter/material.dart';

import '../../../utils/constants/enums.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../custom_shapes/containers/rounded_container.dart';
import '../icons/readify_author_title_with_author_icon.dart';
import '../images/author_rounded_image.dart';


class ReadifyAuthorCard extends StatelessWidget {
  const ReadifyAuthorCard({
    super.key,
    required this.showBorder,
    this.onTap,
  });

  final bool showBorder;
  final void Function() ? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ReadifyRoundedContainer(
        padding: const EdgeInsets.all(ReadifySizes.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            Flexible(
              child: ReadifyAuthorCircularImage(
                isNetworkImage: false,
                image: ReadifyImages.author1,
                size: 50,
              ),
            ),
            const SizedBox(height: ReadifySizes.spaceBtwItems/ 1.5,),
            const SizedBox(width: ReadifySizes.spaceBtwItems/ 1.5,),
            ///text
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  ReadifyAuthorTitleWithAuthorIcon(title: 'Ruskin Bond', authorTextSize: TextSizes.large,),
                  Text(
                    '53 Books',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}