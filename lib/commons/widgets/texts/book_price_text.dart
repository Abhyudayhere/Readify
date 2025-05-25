import 'package:flutter/material.dart';

class ReadifyBookPriceText extends StatelessWidget {
  const ReadifyBookPriceText({
    super.key,
    this.currencySign = '₹',
    required this.price,
    this.maxLines = 1,
    this.isLarge = false,
    this.lineThrough = false,
    this.text = ' /month',
    this.fontSize = 10,
  });

  final String text;
  final double fontSize;
  final String currencySign, price;
  final int maxLines;
  final bool isLarge;
  final bool lineThrough;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: currencySign + price,
            ),
            TextSpan(
              text: text,
              style: TextStyle(fontSize:fontSize, color: Colors.grey),
            ),
          ],
        ),
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
        style: isLarge ? Theme.of(context).textTheme.headlineMedium!.apply(decoration: lineThrough? TextDecoration.lineThrough : null) :Theme.of(context).textTheme.titleLarge!.apply(decoration: lineThrough? TextDecoration.lineThrough : null) ,
    );
  }
}