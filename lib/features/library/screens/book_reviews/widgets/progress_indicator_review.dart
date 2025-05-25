import 'package:flutter/material.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/devices/device_utility.dart';

class ReadifyRatingProgressIndicator extends StatelessWidget {
  const ReadifyRatingProgressIndicator({
    super.key, required this.text, required this.value,
  });

  final String text;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex : 1 ,child: Text(text, style: Theme.of(context).textTheme.bodyMedium)),
        Expanded(
          flex: 11,
          child: SizedBox(
            width: ReadifyDeviceUtils.getScreenWidth(context)*0.5,
            child: LinearProgressIndicator(
              value: value,
              minHeight: 10,
              backgroundColor: ReadifyColors.grey,
              valueColor: AlwaysStoppedAnimation(ReadifyColors.primary),
              borderRadius: BorderRadius.circular(7),
            ),
          ),
        )
      ],
    );
  }
}
