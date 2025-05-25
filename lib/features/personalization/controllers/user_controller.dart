import 'package:Readify/commons/widgets/loader/loaders.dart';
import 'package:Readify/data/repositories/user/user_model.dart';
import 'package:Readify/data/repositories/user/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../commons/widgets/network/network_manager.dart';
import '../../../data/repositories/authentication/authentication_repository.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/popups/full_screen_loader.dart';
import '../screens/profile/widgets/delete_profile.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;
  final hidePassword = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final userRepository = Get.put(UserRepository());


  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  Future<void> fetchUserRecord() async{
    try{
      profileLoading.value = true;
    final user = await userRepository.fetchUserDetails();
    this.user(user);
      profileLoading.value = false;
    } catch(e){
      user(UserModel.empty());
    } finally{
      profileLoading.value = false;
    }
  }

  Future<void> saveUserRecord(UserCredential? userCredentials) async{
    try{
      if (userCredentials != null){
        final nameParts = UserModel.nameParts(userCredentials.user!.displayName?? '');
        final userName = UserModel.generateUserName(userCredentials.user!.displayName?? '');
        final user = UserModel(
          id: userCredentials.user!.uid,
          firstName: nameParts[0],
          lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' '): '',
          username: userName,
          email: userCredentials.user!.email ?? '',
          phoneNumber: userCredentials.user!.phoneNumber ?? '',
          profilePicture: userCredentials.user!.photoURL ?? '',
        );

        await userRepository.saveUserRecords(user);
      }
    }catch(e){
      ReadifyLoaders.warningSnackBar(title: 'Data Not Saved', message: 'something went wrong , try again after sometime');
    }
  }

  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(ReadifySizes.md),
      title: 'Delete Account',
      middleText:
      'Are you sure you want to delete your account permanently? This action is not reversible and all of your data will be removed permanently.',
      confirm: ElevatedButton(
        onPressed: () async => deleteUserAccount(),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          side: const BorderSide(color: Colors.red),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: ReadifySizes.lg),
          child: Text('Delete'),
        ),
      ),
      cancel: OutlinedButton(
        child: const Text('Cancel'),
        onPressed: () => Navigator.of(Get.overlayContext!).pop(),
      ),
    );
  }

  void deleteUserAccount() async {
    try {
      ReadifyFullScreenLoader.openLoadingDialog('Processing', ReadifyImages.decorAnimation);

      /// First re-authenticate user
      final auth = AuthenticationRepository.instance;
      final provider = auth.authUser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
          if (provider == 'password') {
          ReadifyFullScreenLoader.stopLoading();
          Get.to(() => const DeleteProfile());
        }
      }
    } catch (e) {
      ReadifyFullScreenLoader.stopLoading();
      ReadifyLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  Future<void> reAuthenticationEmailAndPasswordUser() async{
    try{
      ReadifyFullScreenLoader.openLoadingDialog('We are Updating Your Information...', ReadifyImages.decorAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected) {ReadifyFullScreenLoader.stopLoading(); return;}

      if(!reAuthFormKey.currentState!.validate()){
        ReadifyFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.reAuthenticateWithEmailAndPassword(verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();


      ReadifyFullScreenLoader.stopLoading();

      ReadifyLoaders.successSnackBar(title: 'Name Changed Sucessfully', message: 'Now New Name Will Be Displayed Soon...'.tr);

    } catch(e){
      ReadifyFullScreenLoader.stopLoading();
      ReadifyLoaders.errorSnackBar(title: 'Aw Snap', message: e.toString());
    }
  }

}