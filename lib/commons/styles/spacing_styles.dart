import 'package:flutter/material.dart';

import '../../utils/constants/sizes.dart';

class ReadifySpacingStyle {
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
    top: ReadifySizes.appBarHeight,
    left: ReadifySizes.defaultSpace,
    bottom: ReadifySizes.defaultSpace,
    right: ReadifySizes.defaultSpace,
  );
}
