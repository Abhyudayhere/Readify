import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:Readify/utils/constants/colors.dart';

class ReadifyChoiceChip extends StatelessWidget {
  const ReadifyChoiceChip({
    super.key,
    required this.text,
    required this.selected,
    required this.onSelected,
  });

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      selected: selected,
      onSelected: onSelected,
      selectedColor: ReadifyColors.primary,
      backgroundColor: Colors.grey[300],
      showCheckmark: false,
      shape: const CircleBorder(),
      labelPadding: EdgeInsets.zero,
      label: SizedBox(
        width: 32,
        height: 32,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Iconsax.global,
              size: 14,
              color: selected ? Colors.white : Colors.black,
            ),
            SizedBox(width: 4),
            Text(
              text,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: selected ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
