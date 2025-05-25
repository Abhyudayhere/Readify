import 'package:Readify/commons/widgets/appbar/appbar.dart';
import 'package:Readify/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../utils/helpers/helper_fuction.dart';
import 'Widget/shelf_items.dart';

class ShelfScreen extends StatelessWidget {
  const ShelfScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = ReadifyHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: ReadifyAppBar(
        title: Text(
          'My Shelf',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      body: const Padding(
          padding: EdgeInsets.all(ReadifySizes.defaultSpace),

        /// Books
        child: ReadifyShelfItems(),
      ),
    );
  }
}
