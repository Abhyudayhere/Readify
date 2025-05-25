import 'package:Readify/commons/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:Readify/features/library/screens/Shelf/Widget/purchased_book.dart';
import 'package:Readify/utils/constants/colors.dart';
import 'package:Readify/utils/constants/sizes.dart';
import 'package:Readify/utils/helpers/helper_fuction.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';


class ReadifyShelfItems extends StatelessWidget {
  const ReadifyShelfItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark =  ReadifyHelperFunctions.isDarkMode(context);
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 1,
      separatorBuilder: (_ , __) => const SizedBox(height: ReadifySizes.spaceBtwItems,),
      itemBuilder: (_ , index) => ReadifyRoundedContainer(
        showBorder: true,
        padding: EdgeInsets.all(ReadifySizes.md),
        backgroundColor: dark ? ReadifyColors.dark : ReadifyColors.light,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            PurchasedBook(),
            const SizedBox(height: ReadifySizes.spaceBtwItems,),

            Row(
              children: [
                Icon(Iconsax.clock),
                SizedBox(width: ReadifySizes.spaceBtwItems /2,),

                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('3 days left', style: Theme.of(context).textTheme.bodyLarge!.apply(color: ReadifyColors.primary , fontWeightDelta: 1),),
                      Text('5 March 2025', style: Theme.of(context).textTheme.headlineSmall),
                    ],
                  ),
                ),
                IconButton(onPressed: () {}, icon: const Icon(Iconsax.arrow_right_34, size: ReadifySizes.iconSm,))
              ],
            ),
            const SizedBox(height: ReadifySizes.spaceBtwItems,),
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Icon(Iconsax.tag),
                      SizedBox(width: ReadifySizes.spaceBtwItems /2,),

                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Book ID', style: Theme.of(context).textTheme.labelMedium),
                            Text('#RB023', style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Icon(Iconsax.calendar),
                      SizedBox(width: ReadifySizes.spaceBtwItems /2,),

                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Purchased', style: Theme.of(context).textTheme.labelMedium),
                            Text('2 Mar 2025', style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
