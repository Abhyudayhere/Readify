import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../commons/widgets/icons/readify_icons_colors.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class AddRemoveRow extends StatefulWidget {
  @override
  _AddRemoveRowState createState() => _AddRemoveRowState();
}

class _AddRemoveRowState extends State<AddRemoveRow> {
  bool isAdd = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isAdd = !isAdd;
        });
      },
      child: Row(
        children: [
          ReadifyCircularIcon(
            icon: isAdd ? Iconsax.add : Iconsax.minus,
            backgroundColor: ReadifyColors.darkerGrey,
            width: 40,
            height: 40,
            color: ReadifyColors.white,
          ),
          const SizedBox(width: ReadifySizes.spaceBtwItems),
          Text(
            isAdd ? 'Add' : 'Remove',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(width: ReadifySizes.spaceBtwItems),
        ],
      ),
    );
  }
}
