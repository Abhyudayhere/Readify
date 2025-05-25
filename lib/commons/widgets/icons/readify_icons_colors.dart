import 'package:Readify/utils/constants/sizes.dart';
import 'package:Readify/utils/helpers/helper_fuction.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';



class ReadifyCircularIcon extends StatelessWidget {
  const ReadifyCircularIcon({
    super.key,
    this.width,
    this.height,
    this.size = ReadifySizes.lg,
    required this.icon,
    this.color,
    this.backgroundColor,
    this.onPressed,
  });

  final double? width, height, size;
  final IconData icon;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height ,
      decoration: BoxDecoration(
        color: backgroundColor != null ?  backgroundColor! : ReadifyHelperFunctions.isDarkMode(context) ? ReadifyColors.black.withAlpha((0.7 * 255).toInt()) : ReadifyColors.white.withAlpha((0.7 * 255).toInt()),
        borderRadius: BorderRadius.circular(100),
      ),
      child: IconButton(onPressed: onPressed, icon: Icon(icon, color: color, size: size,))
    );
  }
}
