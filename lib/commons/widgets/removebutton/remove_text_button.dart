import 'package:Readify/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class ReadifyRemoveTextButton extends StatelessWidget {
  const ReadifyRemoveTextButton({
    super.key,
    required this.text,
    this.onPressed,
  });

  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: ReadifyColors.primary, // Uses primary color
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: ReadifyColors.primary),
      ),
    );
  }
}
