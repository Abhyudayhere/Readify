import 'package:Readify/commons/widgets/appbar/appbar.dart';
import 'package:Readify/commons/widgets/book_cards/book_card_vertical.dart';
import 'package:Readify/commons/widgets/icons/readify_icons_colors.dart';
import 'package:Readify/commons/widgets/layout/grid_layout.dart';
import 'package:Readify/features/library/screens/Home/home.dart';
import 'package:Readify/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class StarredBooksScreen extends StatelessWidget {
  const StarredBooksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReadifyAppBar(
        title: Text('Starred Books',  style: Theme.of(context).textTheme.headlineMedium,),
        actions: [
          ReadifyCircularIcon(icon: Iconsax.add , onPressed: ()=> Get.to(const HomeScreen()),)
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(ReadifySizes.defaultSpace),
          child: Column(
            children: [
              ReadifyGridLayout(itemcount: 1, itemBuilder: (_ , index) => const ReadifyBookCardVertical() )
            ],
          ),
        ),
      ),
    );
  }
}