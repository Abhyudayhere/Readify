import 'package:Readify/commons/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:Readify/commons/widgets/sucess_screen/sucess_screen.dart';
import 'package:Readify/features/library/screens/bookmark/widget/bookmark_item.dart';
import 'package:Readify/features/library/screens/checkout/widget/billing_details.dart';
import 'package:Readify/features/library/screens/checkout/widget/billing_payment_section.dart';
import 'package:Readify/features/library/screens/checkout/widget/payment_method.dart';
import 'package:Readify/navigation_menu.dart';
import 'package:Readify/utils/constants/colors.dart';
import 'package:Readify/utils/constants/image_strings.dart';
import 'package:Readify/utils/constants/sizes.dart';
import 'package:Readify/utils/helpers/helper_fuction.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../commons/widgets/appbar/appbar.dart';
import '../../../../commons/widgets/books/cupon_code/cupon_code.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = ReadifyHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: ReadifyAppBar(
        title: Text(
          'Checkout',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(ReadifySizes.defaultSpace),
          child: Column(
            children: [
              ReadifyBookmarkedItems(showRemoveButton: false,),
              SizedBox(height: ReadifySizes.spaceBtwSection,),

              ///Cupon
              ReadifyCuponCode(),
              SizedBox(height: ReadifySizes.spaceBtwSection,),
              /// Billing
              ReadifyRoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(ReadifySizes.md),
                backgroundColor: dark? ReadifyColors.black : ReadifyColors.white,
                child: Column(
                  children: [
                    ///pricing
                    ReadifyBillingPaymentSection(),
                    const SizedBox(height: ReadifySizes.spaceBtwItems,),
                    ///divider
                    const Divider(),
                    const SizedBox(height: ReadifySizes.spaceBtwItems,),
                    ///payment option
                    ReadifyPaymentOption(),
                    const SizedBox(height: ReadifySizes.spaceBtwItems,),
                    ///e-mail address
                    ReadifyBillingDetails(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
      padding: const EdgeInsets.all(ReadifySizes.defaultSpace),
      child: ElevatedButton(onPressed: () => Get.to(() => SucessScreen(image: ReadifyImages.paymentSuccess, title: 'Payment Sucess!', subTitle: 'New Book will be Added to your shelf Soon!', onPressed:() => Get.offAll(() => const NavigationMenu()))), child: Text('Checkout ₹0')),
      ),
      );
  }
}

