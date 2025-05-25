import 'package:Readify/utils/constants/colors.dart';
import 'package:Readify/utils/constants/enums.dart';
import 'package:Readify/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../texts/readify_author_title_text.dart';

class ReadifyAuthorTitleWithAuthorIcon extends StatelessWidget {
  const ReadifyAuthorTitleWithAuthorIcon({
    super.key,
    required this.title,
    this.maxLines = 1,
    this.textColor,
    this.textStyle,
    this.iconColor = ReadifyColors.primary,
    this.textAlign = TextAlign.center,
    this.authorTextSize = TextSizes.small,
  });

  final String title;
  final int maxLines;
  final TextStyle? textStyle;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes authorTextSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          child: ReadifyAuthorTitleText(
            title: title,
            textStyle: textStyle,
            color: textColor,
            maxLines: maxLines,
            textAlign: textAlign,
            authorTextSize: authorTextSize,
          ),
        ),
        const SizedBox(width: ReadifySizes.xs),
        Baseline(
          baseline: 8,
          baselineType: TextBaseline.alphabetic,
          child: Icon(
            FontAwesomeIcons.userGraduate,
            color: iconColor,
            size: ReadifySizes.iconXs,
          ),
        ),
      ],
    );
  }
}
