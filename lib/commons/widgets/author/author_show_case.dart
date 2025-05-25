import 'package:Readify/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_fuction.dart';
import '../custom_shapes/containers/rounded_container.dart';
import 'author_card.dart';


class ReadifyBookShowcase extends StatelessWidget {
  const ReadifyBookShowcase({
    super.key, required this.images,
  });
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return ReadifyRoundedContainer(
      showBorder: true,
      borderColor: ReadifyColors.darkGrey,
      backgroundColor: Colors.transparent,
      padding: const EdgeInsets.all(ReadifySizes.md),
      margin: const EdgeInsets.only(
          bottom: ReadifySizes.spaceBtwItems),
      child: Column(
        children: [
          ///authhors
           ReadifyAuthorCard(showBorder: false,),
          const SizedBox(height: ReadifySizes.spaceBtwItems,),
          /// top 3 books
          Row(
            children: images.map((image) => authorsTopBookImageWidget(image , context)).toList(),
          )

        ],
      ),
    );
  }
}

Widget authorsTopBookImageWidget(String image, context){
  return Expanded(
    child: ReadifyRoundedContainer(
      height: 100,
      backgroundColor: ReadifyHelperFunctions.isDarkMode(context) ? ReadifyColors.darkerGrey : ReadifyColors.light,
      margin: const EdgeInsets.only(right: ReadifySizes.sm + 10),
      padding: const EdgeInsets.all(ReadifySizes.md / 2),
      child: Image(image: AssetImage(image), fit: BoxFit.contain,),
    ),
  );
}