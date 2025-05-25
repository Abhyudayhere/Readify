import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../curved_edges/curved_edges_widget.dart';
import 'circular_container.dart';

class ReadifyPrimaryHeaderContainer extends StatelessWidget {
  const ReadifyPrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ReadifyCurvedEdgeWidget(
      child: SizedBox(
        child: Container(
          color: ReadifyColors.primary,
          padding: const EdgeInsets.only(bottom: 0),
          child: Stack(
            children: [
              Positioned(
                  top: -150,
                  right: -250,
                  child: ReadifyCircularContainer(
                    margin: EdgeInsets.zero,
                      backgroundColor: ReadifyColors.textWhite
                          .withAlpha((0.1 * 225).toInt()))),
              Positioned(
                  top: 100,
                  right: -300,
                  child: ReadifyCircularContainer(
                      margin: EdgeInsets.zero,
                      backgroundColor: ReadifyColors.textWhite
                          .withAlpha((0.1 * 225).toInt()))),
                  child,
            ],
          ),
        ),
      ),
    );
  }
}
