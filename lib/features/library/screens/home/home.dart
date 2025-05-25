import 'package:Readify/commons/widgets/layout/grid_layout.dart';
import 'package:Readify/features/library/screens/Home/widgets/home_appbar.dart';
import 'package:Readify/features/library/screens/Home/widgets/promo_slider.dart';
import 'package:Readify/features/library/screens/home/widgets/home_cateogory.dart';
import 'package:flutter/material.dart';
import '../../../../commons/widgets/book_cards/book_card_vertical.dart';
import '../../../../commons/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../commons/widgets/custom_shapes/containers/search_container.dart';
import '../../../../commons/widgets/texts/section_heading.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///header
            ReadifyPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// HomeAppBar
                  const ReadifyHomeAppBar(),
                  const SizedBox(
                    height: ReadifySizes.spaceBtwSection,
                  ),

                  /// SearchBar
                  const ReadifySearchContainer(
                    text: 'Search in Vast Library',
                  ),
                  const SizedBox(
                    height: ReadifySizes.spaceBtwSection,
                  ),

                  ///Cateogories
                  Padding(
                    padding:
                        const EdgeInsets.only(left: ReadifySizes.defaultSpace),
                    child: Column(
                      children: [
                        ///heading
                        ReadifySectionHeading(
                          title: 'Popular Genres',
                          showActionButton: false,
                          textColor: Colors.white,
                        ),
                        const SizedBox(
                          height: ReadifySizes.spaceBtwItems,
                        ),

                        ///Cateogories
                        ReadifyHomeCategory()
                      ],
                    ),
                  ),
                  SizedBox(height: ReadifySizes.spaceBtwSection,),
                ],
              ),
            ),

            ///body
            Padding(
                padding: const EdgeInsets.all(ReadifySizes.defaultSpace),
                child: Column(
                  children: [
                    ///promo slider
                    ReadifyPromoSlider(
                      banners: [
                        ReadifyImages.promoBanner1,
                        ReadifyImages.promoBanner2,
                        ReadifyImages.promoBanner3
                      ],
                    ),
                    SizedBox(
                      height: ReadifySizes.spaceBtwSection,
                    ),

                    ///heading
                    ReadifySectionHeading(
                      title: 'Popular Books',
                      onPressed: () {},
                    ),
                    const SizedBox(
                      height: ReadifySizes.spaceBtwItems,
                    ),

                    /// popular books
                        ReadifyGridLayout(
                            itemcount: 4,
                            itemBuilder: (_, index) =>
                            const ReadifyBookCardVertical())
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
