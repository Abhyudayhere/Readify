import 'package:flutter/material.dart';

import '../../../../../commons/widgets/bookmarks/bookmark_item.dart';
import '../../../../../commons/widgets/removebutton/remove_text_button.dart';
import '../../../../../commons/widgets/texts/book_price_text.dart';
import '../../../../../utils/constants/sizes.dart';

class ReadifyBookmarkedItems extends StatelessWidget {
  const ReadifyBookmarkedItems({super.key,this.showRemoveButton = true});


  final bool showRemoveButton;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_, __) => const SizedBox(
        height: ReadifySizes.spaceBtwSection,
      ),
      itemCount: 1,
      itemBuilder: (_, index) => Column(
        children: [
          ReadifyBookmarkItem(),
          if(showRemoveButton) const SizedBox(height: ReadifySizes.spaceBtwItems,),

          if(showRemoveButton) const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(width: 70,),
                  ReadifyRemoveTextButton(text: 'Remove',),
                ],
              ),

              ReadifyBookPriceText(price: '0/-' , text: '',)
            ],
          ),

        ],
      ),
    );
  }
}
