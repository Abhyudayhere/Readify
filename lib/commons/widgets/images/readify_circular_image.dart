import 'package:Readify/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper_fuction.dart';

class ReadifyCircularImage extends StatelessWidget {
  const ReadifyCircularImage({
    super.key,
    this.fit = BoxFit.cover,
    required this.image,
    this.isNetworkImage = false,
    this.backgroundColor,
    this.width = 56,
    this.height = 56,
    this.padding = ReadifySizes.sm,
  });

  final BoxFit? fit;
  final String image;
  final Color? backgroundColor;
  final bool isNetworkImage;
  final double width, height, padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
          color: backgroundColor ?? (ReadifyHelperFunctions.isDarkMode(context)? ReadifyColors.black : ReadifyColors.white),
          borderRadius: BorderRadius.circular(100)
      ),
      child: Image(
        fit: fit,
        image: isNetworkImage ? NetworkImage(image) : AssetImage(image) as ImageProvider,
        // color: overlayColor),
      )
    );
  }
}