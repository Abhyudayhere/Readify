import 'package:Readify/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class ReadifyCustomChoiceChip extends StatelessWidget {
  const ReadifyCustomChoiceChip({
    super.key,
    required this.text,
    required this.selected,
    this.onSelected,
  });

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) { // Default color
    final Color backgroundColor = ReadifyColors.primary;
    return ChoiceChip(
      label: Text(
        text,
        style: TextStyle(
          color: selected ? Colors.white : Colors.black,
          fontWeight: FontWeight.w600,
        ),
      ),
      selected: selected,
      onSelected: onSelected,
      backgroundColor: Colors.white,
      selectedColor: backgroundColor,
      labelPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: backgroundColor),
      ),
    );
  }
}
