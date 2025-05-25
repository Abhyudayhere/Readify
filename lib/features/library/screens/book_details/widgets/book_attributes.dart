import 'package:Readify/commons/widgets/chips/choice_chip.dart';
import 'package:Readify/commons/widgets/chips/choice_chip_custom.dart';
import 'package:Readify/commons/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:Readify/commons/widgets/texts/book_price_text.dart';
import 'package:Readify/commons/widgets/texts/book_title_text.dart';
import 'package:Readify/utils/constants/colors.dart';
import 'package:Readify/utils/constants/sizes.dart';
import 'package:Readify/utils/helpers/helper_fuction.dart';
import 'package:flutter/material.dart';

import '../../../../../commons/widgets/texts/section_heading.dart';

class ReadifyBookAttributes extends StatefulWidget {
  const ReadifyBookAttributes({super.key});

  @override
  State<ReadifyBookAttributes> createState() => _ReadifyBookAttributesState();
}

class _ReadifyBookAttributesState extends State<ReadifyBookAttributes> {
  // selected language & duration
  String selectedLanguage = 'A';
  String selectedDuration = '3-Days';

  @override
  Widget build(BuildContext context) {
    final dark = ReadifyHelperFunctions.isDarkMode(context);

    String priceText = selectedDuration == '3-Days' ? 'Free' : '9.0/-';
    String subtitleText = selectedDuration == '3-Days'
        ? '/3-Days'
        : '/Month';

    return Column(
      children: [
        /// Top container with price and language info
        ReadifyRoundedContainer(
          padding: const EdgeInsets.all(ReadifySizes.md),
          backgroundColor: dark ? ReadifyColors.darkerGrey : ReadifyColors.grey,
          child: Column(
            children: [
              Row(
                children: [
                  const ReadifySectionHeading(title: 'Variation', showActionButton: false),
                  const SizedBox(width: ReadifySizes.spaceBtwItems),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const ReadifyBookTitleText(title: 'Price : ', smallSize: true),
                          if (selectedDuration == 'Month') // show strike price only for Month
                            Text(
                              '₹179.0/-',
                              style: Theme.of(context).textTheme.titleSmall!.apply(
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                          const SizedBox(width: ReadifySizes.spaceBtwItems),
                          ReadifyBookPriceText(price: priceText, text: subtitleText),
                        ],
                      ),
                      Row(
                        children: [
                          const ReadifyBookTitleText(title: 'Language : ', smallSize: true),
                          Text(selectedLanguage, style: Theme.of(context).textTheme.titleSmall),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: ReadifySizes.spaceBtwItems / 2),
              ReadifyBookTitleText(
                title: "You've selected a $selectedDuration read trial of The Girl on the Train ($selectedLanguage)",
                smallSize: true,
                maxLines: 4,
              ),
            ],
          ),
        ),

        const SizedBox(height: ReadifySizes.spaceBtwItems),

        /// Language Chips
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ReadifySectionHeading(title: 'Language', showActionButton: false),
            const SizedBox(height: ReadifySizes.spaceBtwItems / 2),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: ['A', 'अ', 'অ'].map((lang) {
                return ReadifyChoiceChip(
                  text: lang,
                  selected: selectedLanguage == lang,
                  onSelected: (val) {
                    setState(() {
                      selectedLanguage = lang;
                    });
                  },
                );
              }).toList(),
            ),
          ],
        ),

        const SizedBox(height: ReadifySizes.spaceBtwItems),

        /// Duration Chips
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ReadifySectionHeading(title: 'Duration', showActionButton: false),
            const SizedBox(height: ReadifySizes.spaceBtwItems / 2),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: ['3-Days', 'Month'].map((duration) {
                return ReadifyCustomChoiceChip(
                  text: duration,
                  selected: selectedDuration == duration,
                  onSelected: (val) {
                    setState(() {
                      selectedDuration = duration;
                    });
                  },
                );
              }).toList(),
            ),
          ],
        ),
      ],
    );
  }
}

