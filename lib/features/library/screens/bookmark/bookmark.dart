import 'package:Readify/commons/widgets/appbar/appbar.dart';
import 'package:Readify/features/library/screens/bookmark/widget/bookmark_item.dart';
import 'package:Readify/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../checkout/checkout.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReadifyAppBar(
        title: Text(
          'Bookmarks',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(ReadifySizes.defaultSpace),
        child: ReadifyBookmarkedItems(),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(ReadifySizes.defaultSpace),
        child: ElevatedButton(onPressed: () => Get.to(() => const CheckoutScreen()), child: Text('Checkout ₹0')),
      ),
    );
  }
}
