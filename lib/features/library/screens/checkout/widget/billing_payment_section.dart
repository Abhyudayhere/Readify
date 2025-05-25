import 'package:Readify/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ReadifyBillingPaymentSection extends StatelessWidget {
  const ReadifyBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ///SubTotal
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Subtotal', style: Theme.of(context).textTheme.bodyMedium,),
            Text('₹0/-', style: Theme.of(context).textTheme.bodyMedium,),
          ],
        ),
        const SizedBox(height: ReadifySizes.spaceBtwItems / 2 ,),
        /// GST
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('GST 5% : ', style: Theme.of(context).textTheme.bodyMedium,),
            Text('₹0/-', style: Theme.of(context).textTheme.labelLarge,),
          ],
        ),
        const SizedBox(height: ReadifySizes.spaceBtwItems / 2 ,),
        ///Total
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Total : ', style: Theme.of(context).textTheme.bodyMedium,),
            Text('₹0/-', style: Theme.of(context).textTheme.titleMedium,),
          ],
        ),
        const SizedBox(height: ReadifySizes.spaceBtwItems / 2 ,),
      ],
    );
  }
}
