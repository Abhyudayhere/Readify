import 'package:Readify/commons/widgets/loader/loaders.dart';
import 'package:Readify/commons/widgets/network/network_manager.dart';
import 'package:Readify/data/repositories/authentication/authentication_repository.dart';
import 'package:Readify/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:Readify/utils/constants/image_strings.dart';
import 'package:Readify/utils/popups/full_screen_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController{
  static ForgetPasswordController get instance => Get.find();

  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  sendPasswordResetEmail() async{
    try{
      ReadifyFullScreenLoader.openLoadingDialog('processing your request...', ReadifyImages.decorAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected) {ReadifyFullScreenLoader.stopLoading(); return;}

      if(!forgetPasswordFormKey.currentState!.validate()){
        ReadifyFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());

      ReadifyFullScreenLoader.stopLoading();

      ReadifyLoaders.successSnackBar(title: 'Email sent', message: 'Email Link Sent to reset your password'.tr);
      Get.to(() => ResetPassword(email : email.text.trim()));

    } catch(e){
      ReadifyFullScreenLoader.stopLoading();
      ReadifyLoaders.errorSnackBar(title: 'Aw Snap', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async{
    try{
      ReadifyFullScreenLoader.openLoadingDialog('processing your request...', ReadifyImages.decorAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected) {ReadifyFullScreenLoader.stopLoading(); return;}


      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      ReadifyFullScreenLoader.stopLoading();

      ReadifyLoaders.successSnackBar(title: 'Email sent', message: 'Email Link Sent to reset your password'.tr);

    } catch(e){
      ReadifyFullScreenLoader.stopLoading();
      ReadifyLoaders.errorSnackBar(title: 'Aw Snap', message: e.toString());
    }
  }
  }

