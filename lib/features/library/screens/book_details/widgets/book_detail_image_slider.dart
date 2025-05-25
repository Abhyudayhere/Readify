import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../commons/widgets/appbar/appbar.dart';
import '../../../../../commons/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import '../../../../../commons/widgets/icons/readify_icons_colors.dart';
import '../../../../../commons/widgets/images/readify_rounded_images.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_fuction.dart';

class ReadifyBookImageSlider extends StatelessWidget {
  const ReadifyBookImageSlider({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final dark = ReadifyHelperFunctions.isDarkMode(context);
    return ReadifyCurvedEdgeWidget(
      child: Container(
        color: dark ? ReadifyColors.darkerGrey : ReadifyColors.light ,
        child: Stack(
          children: [
            const SizedBox(
              height: 400 , child: Padding(
              padding: EdgeInsets.all(ReadifySizes.bookImageRadius *2 ),
              child: Center(child: Image(image: AssetImage(ReadifyImages.book1))),
            ),
            ),
            //image slider

            Positioned(
              right: 0,
              bottom: 30,
              left: ReadifySizes.defaultSpace,
              child: SizedBox(
                height: 100,
                child: ListView.separated(
                  separatorBuilder: (_, __) => const SizedBox(width: ReadifySizes.spaceBtwItems),
                  itemCount: 4,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (_, index) => ReadifyRoundedImage(
                    width: 80,
                    border: Border.all(color: ReadifyColors.primary),
                    padding: const EdgeInsets.all(ReadifySizes.sm),
                    backgroundColor: dark ? ReadifyColors.dark : ReadifyColors.white,
                    imageUrl: ReadifyImages.bookBack1,
                  ),
                ),
              ),
            ),

            const ReadifyAppBar(
              showBackArrow : true,
              actions: [
                ReadifyCircularIcon(icon: FontAwesomeIcons.solidStar , color: Colors.yellow,)
              ],
            )

          ],
        ),
      ),
    );
  }
}
