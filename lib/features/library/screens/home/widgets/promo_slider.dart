import 'package:Readify/features/library/controllers/home_controller.dart';
import 'package:Readify/utils/constants/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../commons/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../../commons/widgets/images/readify_rounded_images.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_fuction.dart';


class ReadifyPromoSlider extends StatelessWidget {
  const ReadifyPromoSlider({
    super.key, required this.banners,
  });

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1,
            onPageChanged: (index , _) => controller.updatePageIndicator(index)
          ),
          items: banners.map((url) => ReadifyRoundedImage(backgroundColor: ReadifyHelperFunctions.isDarkMode(context)? Colors.black : Colors.white ,fit: BoxFit.cover, imageUrl: url)).toList(),
        ),
        const SizedBox(height: ReadifySizes.spaceBtwItems,),
        Center(
          child: Obx(
              () => Row(
                mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i<banners.length; i++)
                  ReadifyCircularContainer(
                    margin: const EdgeInsets.only(right: 10),
                    width: 20,
                    height: 4,
                    backgroundColor: controller.carousalCurrentIndex.value == i ? ReadifyColors.primary : ReadifyColors.grey,
                  ),

              ],
            ),
          ),
        ),
      ],
    );
  }
}