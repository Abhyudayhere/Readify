import 'package:Readify/utils/constants/colors.dart';
import 'package:Readify/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ReadifyRoundedContainer extends StatelessWidget {
  const ReadifyRoundedContainer({super.key,
    this.width,
    this.height,
    this.radius = ReadifySizes.cardRadiusLg,
    this.child,
    this.showBorder = false,
    this.borderColor = ReadifyColors.borderPrimary,
    this.backgroundColor = ReadifyColors.white,
    this.padding,
    this.margin
  });

  final double? width;
  final double? height;
  final double radius;
  final Widget? child;
  final bool showBorder;
  final Color borderColor;
  final Color backgroundColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
        border: showBorder ? Border.all(color: borderColor): null,
      ),
      child: child,
    );
  }
}
