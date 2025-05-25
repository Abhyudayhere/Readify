import 'package:Readify/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class ReadifyShadowStyle{
  static final verticalBookShadow = BoxShadow(
    color: ReadifyColors.darkGrey.withAlpha((0.1 * 255).toInt()),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2)
  );

  static final horizontalBookShadow = BoxShadow(
    color: ReadifyColors.darkGrey.withAlpha((0.1 * 255).toInt()),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2)
  );

}