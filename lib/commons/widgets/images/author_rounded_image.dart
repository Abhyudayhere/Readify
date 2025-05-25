import 'package:flutter/material.dart';

class ReadifyAuthorCircularImage extends StatelessWidget {
  const ReadifyAuthorCircularImage({
    super.key,
    required this.image,
    this.size = 56,
    this.isNetworkImage = false,
    this.fit = BoxFit.cover,
  });

  final String image;
  final double size;
  final bool isNetworkImage;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image(
        image: isNetworkImage ? NetworkImage(image) : AssetImage(image) as ImageProvider,
        width: size,
        height: size,
        fit: fit,
      ),
    );
  }
}
