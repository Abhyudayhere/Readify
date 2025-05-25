import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';


class ReadifyRoundedImage extends StatelessWidget {
  const ReadifyRoundedImage({
    super.key,
    this.width ,
    this.height ,
    required this.imageUrl,
    this.applyImageRadius = true,
    this.border,
    this.fit = BoxFit.contain,
    this.backgroundColor,
    this.padding,
    this.isNetworkImage = false,
    this.onPressed,
    this.borderRadius =ReadifySizes.md,

  });

  final double? width, height;
  final String imageUrl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final BoxFit? fit;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double borderRadius;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration( border: border, color: backgroundColor, borderRadius: BorderRadius.circular(borderRadius)),
        child: ClipRRect(
          borderRadius: applyImageRadius? BorderRadius.circular(0) : BorderRadius.zero,
          child: Image(fit: fit, image: isNetworkImage? NetworkImage(imageUrl) : AssetImage(imageUrl) as ImageProvider,),
        ),
      ),
    );
  }
}