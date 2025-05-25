import 'package:Readify/utils/constants/enums.dart';
import 'package:flutter/material.dart';

class ReadifyAuthorTitleText extends StatelessWidget {
  const ReadifyAuthorTitleText({
    super.key,
    required this.title,
    this.maxLines = 1,
    this.color,
    this.textStyle,
    this.textAlign = TextAlign.center,
    this.authorTextSize = TextSizes.small,
  });

  final String title;
  final int maxLines;
  final Color? color;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  final TextSizes authorTextSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style:  textStyle ?? (authorTextSize == TextSizes.small
          ? Theme.of(context).textTheme.labelMedium!.apply(color: color)
          : authorTextSize == TextSizes.medium
              ? Theme.of(context).textTheme.bodyLarge!.apply(color: color)
              : authorTextSize == TextSizes.large
                  ? Theme.of(context).textTheme.titleLarge!.apply(color: color)
                  : Theme.of(context).textTheme.bodyMedium!.apply(color: color)),
    );
  }
}
