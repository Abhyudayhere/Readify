import 'package:Readify/commons/widgets/images/readify_circular_image.dart';
import 'package:Readify/commons/widgets/texts/section_heading.dart';
import 'package:Readify/features/personalization/screens/profile/widgets/change_name.dart';
import 'package:Readify/features/personalization/screens/profile/widgets/delete_profile.dart';
import 'package:Readify/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:Readify/utils/constants/image_strings.dart';
import 'package:Readify/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../commons/widgets/appbar/appbar.dart';
import '../../controllers/user_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: ReadifyAppBar(showBackArrow: true, title: Text('Profile'),),

      ///body
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(ReadifySizes.defaultSpace),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const ReadifyCircularImage(image: ReadifyImages.user, width: 80, height: 80,),
                    TextButton(onPressed: () {}, child: const Text('Change Profile Picture') )
                  ],
                ),
              ),

              ///Details
              const SizedBox(height: ReadifySizes.spaceBtwItems/2,),
              const Divider(),
              const SizedBox(height: ReadifySizes.spaceBtwItems),
              
              ReadifySectionHeading(title: 'Profile Information', showActionButton: false,),
              const SizedBox(height: ReadifySizes.spaceBtwItems,),

              ReadifyProfileMenu(title: 'Name',value: controller.user.value.fullName , onPressed: () => Get.to(() => ChangeName()),),
              ReadifyProfileMenu(title: 'UserName',value: controller.user.value.username ,icon: Iconsax.copy, onPressed: () {},),

              const SizedBox(height: ReadifySizes.spaceBtwItems/2,),
              const Divider(),
              const SizedBox(height: ReadifySizes.spaceBtwItems),
              ReadifySectionHeading(title: 'Personal Information', showActionButton: false,),
              ReadifyProfileMenu(title: 'Library ID',value:  controller.user.value.id,icon: Iconsax.copy, onPressed: () {},),
              ReadifyProfileMenu(title: 'E- mail',value: controller.user.value.email , onPressed: () {},),
              ReadifyProfileMenu(title: 'Mobile Number',value: controller.user.value.phoneNumber , onPressed: () {},),
              // ReadifyProfileMenu(title: 'Gender',value: 'Male' , onPressed: () {},),
              // ReadifyProfileMenu(title: 'Date of Birth',value: '14 March 2002' , onPressed: () {},),

              const Divider(),
              const SizedBox(height: ReadifySizes.spaceBtwItems),
              
              Center(
                child: TextButton(onPressed: () => Get.to(() => DeleteProfile()), child: const Text('Delete Account' , style: TextStyle(color: Colors.red),)),
              )

            ],
          ),
        ),
      ),
    );
  }
}

