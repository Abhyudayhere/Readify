import 'package:Readify/utils/constants/image_strings.dart';
import 'package:Readify/utils/popups/full_screen_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';
import '../../../../commons/widgets/loader/loaders.dart';
import '../../../../commons/widgets/network/network_manager.dart';
import '../../../../data/repositories/authentication/authentication_repository.dart';

class LoginController extends GetxController{
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  ///var
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();


  @override
  void onInit() {
    email.text = localStorage.read('REMEMBER_ME_EMAIL') ?? '';
    password.text = localStorage.read('REMEMBER_ME_PASSWORD') ?? '';
    super.onInit();
  }

  Future<void> emailAndPasswordSignIn() async{
    try{
      ReadifyFullScreenLoader.openLoadingDialog('Logging you in...', ReadifyImages.decorAnimation);
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        ReadifyFullScreenLoader.stopLoading();
        return;
      }

      if (loginFormKey.currentState == null || !loginFormKey.currentState!.validate()) {
        ReadifyFullScreenLoader.stopLoading();
        return;
      }

      if(rememberMe.value){
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      final userCredential = await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      ReadifyFullScreenLoader.stopLoading();

      AuthenticationRepository.instance.screenRedirect();
    }
    catch (e){
      ReadifyFullScreenLoader.stopLoading();
      ReadifyLoaders.errorSnackBar(title: 'oh snap' ,message: e.toString());
    }
  }
}