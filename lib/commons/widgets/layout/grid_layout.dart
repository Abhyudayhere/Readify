import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';

class ReadifyGridLayout extends StatelessWidget {
  const ReadifyGridLayout(
      {super.key,
      required this.itemcount,
      this.mainAxisExtent = 288,
      required this.itemBuilder});

  final int itemcount;
  final double? mainAxisExtent;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: itemcount,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: ReadifySizes.gridViewSpacing,
        crossAxisSpacing: ReadifySizes.gridViewSpacing,
        mainAxisExtent: mainAxisExtent,
      ),
      itemBuilder: itemBuilder,
    );
  }
}
