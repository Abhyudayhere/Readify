import 'package:Readify/utils/constants/colors.dart';
import 'package:Readify/utils/devices/device_utility.dart';
import 'package:Readify/utils/helpers/helper_fuction.dart';
import 'package:flutter/material.dart';

class ReadifyTabBar extends StatelessWidget implements PreferredSizeWidget {
  const ReadifyTabBar({
    super.key,
    required this.tabs});

  final List<Widget> tabs;
  
  @override
  Widget build(BuildContext context) {
    final dark = ReadifyHelperFunctions.isDarkMode(context);
    return Material(
      color: dark ? ReadifyColors.black : ReadifyColors.white,
      child: TabBar(
          isScrollable: true,
          indicatorColor: ReadifyColors.primary ,
          unselectedLabelColor: ReadifyColors.darkGrey,
          labelColor: ReadifyHelperFunctions.isDarkMode(context) ? ReadifyColors.white : ReadifyColors.primary,
          tabs: tabs),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(ReadifyDeviceUtils.getAppBarHeight());
}
