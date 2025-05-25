import 'package:Readify/commons/widgets/appbar/appbar.dart';
import 'package:Readify/commons/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:Readify/commons/widgets/list_tile/settings_menu_tile.dart';
import 'package:Readify/commons/widgets/texts/section_heading.dart';
import 'package:Readify/features/authentication/screens/login/login.dart';
import 'package:Readify/features/library/screens/bookmark/bookmark.dart';
import 'package:Readify/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../commons/widgets/list_tile/user_profile_tile.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../library/screens/Shelf/shelf.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///header
            ReadifyPrimaryHeaderContainer(child: Column(
              children: [
                ReadifyAppBar(
                  title: Text('Account' , style: Theme.of(context).textTheme.headlineMedium!.apply(color: ReadifyColors.white),),
                ),

                ///user profile card
                ReadifyUserProfileTile(),
                const SizedBox(height: ReadifySizes.spaceBtwSection,)
              ],
            )),
            
            ///body
            Padding(
                padding: EdgeInsets.all(ReadifySizes.defaultSpace),
                child: Column(
                  children: [
                    ///Account setting
                    ReadifySectionHeading(title: 'Account Settings' , showActionButton: false,),
                    SizedBox(height: ReadifySizes.spaceBtwItems,),

                    ReadifySettingsMenuTile(icon: Iconsax.bookmark, title: 'Bookmarks', subtitle: 'Books You Love, One Tap Away' , onTap: () => Get.to(() => const BookmarkScreen()),),
                    ReadifySettingsMenuTile(icon: Iconsax.book, title: 'My Shelf', subtitle: 'Your Library, Your Way' , onTap: ()=> Get.to(() => const ShelfScreen()),),
                    ReadifySettingsMenuTile(icon: Iconsax.card, title: 'Subscription', subtitle: 'Seamless Access, Endless Stories' , onTap: (){},),
                    ReadifySettingsMenuTile(icon: Iconsax.discount_shape, title: 'My Cupons', subtitle: 'Save More, Read More!' , onTap: (){},),
                    ReadifySettingsMenuTile(icon: Iconsax.notification, title: 'Notification', subtitle: 'Your Reading Alerts, All in One Place' , onTap: (){},),
                    ReadifySettingsMenuTile(icon: Iconsax.security_card, title: 'Account Privacy', subtitle: 'Manage Privacy, Enjoy Worry-Free Reading ' , onTap: (){},),

                    ///app settings
                    SizedBox(height: ReadifySizes.spaceBtwSection,),
                    ReadifySectionHeading(title: 'App Settings' , showActionButton: false,),
                    SizedBox(height: ReadifySizes.spaceBtwItems,),
                    ReadifySettingsMenuTile(icon: Iconsax.document_upload, title: 'Load Data', subtitle: 'Manage & Sync Your Library Data Efficiently'),
                    ReadifySettingsMenuTile(icon: Iconsax.location, title: 'Language & Localization', subtitle: 'Change app language, Region-based content' , trailing : Switch(value: false, onChanged: (value) {}) ),
                    ReadifySettingsMenuTile(icon: Iconsax.security_user, title: 'Safe Mode', subtitle: 'A Secure & Filtered Reading Experience', trailing : Switch(value: false, onChanged: (value) {})),

                    ///Logout Button
                    const SizedBox(height: ReadifySizes.spaceBtwSection,),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(onPressed: () => Get.to(() => const LoginScreen()), child: const Text('Logout')),
                    ),
                    const SizedBox(height: ReadifySizes.spaceBtwSection * 2.5 ,)
                  ],
                ),
            )
          ],
        ),
      ),
    );
  }
}


