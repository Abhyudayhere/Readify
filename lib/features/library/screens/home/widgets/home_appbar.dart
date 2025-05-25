import 'package:Readify/features/personalization/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../commons/widgets/appbar/appbar.dart';
import '../../../../../commons/widgets/bookmarks/bookmark_menu_icon.dart';
import '../../../../../commons/widgets/loader/shimmer_loader.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_strings.dart';

class ReadifyHomeAppBar extends StatelessWidget {
  const ReadifyHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());

    return ReadifyAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            ReadifyTexts.homeAppbarTitle,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: ReadifyColors.grey),
          ),
          Obx(() {
            if (controller.profileLoading.value) {
              return const ReadifyShimmerLoader(width: 80, height: 15);
            } else{
            return Text(
              controller.user.value.fullName,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .apply(color: ReadifyColors.white),
            );
            }
          }),
        ],
      ),
      actions: const [
        ReadifyBookmarkCounterIcon(iconColor: ReadifyColors.white),
      ],
    );
  }
}
