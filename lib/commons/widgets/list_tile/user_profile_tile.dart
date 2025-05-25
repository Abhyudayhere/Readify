import 'package:Readify/features/personalization/controllers/user_controller.dart';
import 'package:Readify/features/personalization/screens/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../images/readify_circular_image.dart';

class ReadifyUserProfileTile extends StatelessWidget {
  const ReadifyUserProfileTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return ListTile(
      leading : ReadifyCircularImage(image: ReadifyImages.user,width: 60, height: 60,padding: 0,),
      title: Text(controller.user.value.fullName, style: Theme.of(context).textTheme.headlineSmall!.apply(color: ReadifyColors.white),),
      subtitle: Text(controller.user.value.email, style: Theme.of(context).textTheme.bodyMedium!.apply(color: ReadifyColors.white),),
      trailing: IconButton(onPressed: () => Get.to(() => ProfileScreen()), icon: Icon(Iconsax.edit, color: ReadifyColors.white,)),
    );
  }
}