import 'package:flutter/material.dart';

import '../../../../../commons/widgets/image_text_widgets/vertical_image_text.dart';
import '../../../../../utils/constants/image_strings.dart';

class ReadifyHomeCategory extends StatelessWidget {
  const ReadifyHomeCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {'image': ReadifyImages.actionIcon, 'title': 'Action'},
      {'image': ReadifyImages.romanceIcon, 'title': 'Romance'},
      {'image': ReadifyImages.horrorIcon, 'title': 'Horror'},
      {'image': ReadifyImages.mystreyIcon, 'title': 'Fantasy'},
      {'image': ReadifyImages.travelIcon, 'title': 'Mystery'},
      {'image': ReadifyImages.scifiIcon, 'title': 'Sci-Fi'},
    ];

    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          final category = categories[index];
          return ReadifyVerticalImageText(
            image: category['image']!,
            title: category['title']!,
            onTap: () {},
          );
        },
      ),
    );
  }
}