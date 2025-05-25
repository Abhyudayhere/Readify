import 'package:Readify/commons/widgets/book_cards/book_card_vertical.dart';
import 'package:Readify/commons/widgets/layout/grid_layout.dart';
import 'package:Readify/commons/widgets/texts/section_heading.dart';
import 'package:flutter/material.dart';
import '../../../../../commons/widgets/author/author_show_case.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class ReadifyCateogoryTab extends StatelessWidget {
  const ReadifyCateogoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    // Book data
    final books = [
      {'imageUrl': ReadifyImages.book1, 'title': 'The Alchemist', 'author': 'Paulo Coelho', 'price': '8.0'},
      {'imageUrl': ReadifyImages.book2, 'title': 'Pride and Prejudice', 'author': 'Jane Austen', 'price': '10.0'},
      {'imageUrl': ReadifyImages.book3, 'title': 'The Great Gatsby', 'author': 'F. Scott Fitzgerald', 'price': '14.0'},
      {'imageUrl': ReadifyImages.book4, 'title': 'Moby Dick', 'author': 'Herman Melville', 'price': '11.0'},
    ];

    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: EdgeInsets.all(ReadifySizes.defaultSpace),
          child: Column(
            children: [
              /// Authors Showcase
              ReadifyBookShowcase(images: [ReadifyImages.book1, ReadifyImages.book2, ReadifyImages.book3]),
              ReadifyBookShowcase(images: [ReadifyImages.book1, ReadifyImages.book2, ReadifyImages.book3]),
              const SizedBox(height: ReadifySizes.spaceBtwItems),

              /// Section Heading
              ReadifySectionHeading(
                title: 'You Might Like',
                showActionButton: true,
                onPressed: () {},
              ),
              const SizedBox(height: ReadifySizes.spaceBtwItems),

              /// Book Grid Layout
              ReadifyGridLayout(
                itemcount: books.length,
                itemBuilder: (_, index) => ReadifyBookCardVertical(),
              ),
              const SizedBox(height: ReadifySizes.spaceBtwItems),
            ],
          ),
        ),
      ],
    );
  }
}
