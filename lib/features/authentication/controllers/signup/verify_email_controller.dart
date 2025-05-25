import 'dart:async';
import 'package:Readify/commons/widgets/loader/loaders.dart';
import 'package:Readify/commons/widgets/sucess_screen/sucess_screen.dart';
import 'package:Readify/utils/constants/image_strings.dart';
import 'package:Readify/utils/constants/text_strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../../data/repositories/authentication/authentication_repository.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  sendEmailVerification() async{
    try{
      await AuthenticationRepository.instance.sendEmailVerification();
      ReadifyLoaders.successSnackBar(title: 'Email Sent', message:'Please Check your Inbox and Verify your Email');
    }catch(e){
      ReadifyLoaders.errorSnackBar(title: 'oh Snap!', message: e.toString());
    }
  }

  setTimerForAutoRedirect(){
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if(user?.emailVerified ?? false){
        timer.cancel();
        Get.off(() => SucessScreen(image: ReadifyImages.successfulRegisterAnimation, title: ReadifyTexts.yourAccountCreatedTitle, subTitle: ReadifyTexts.yourAccountCreatedSubTitle, onPressed: ()=> AuthenticationRepository.instance.screenRedirect()));
      }
    });
  }

    checkEmailVerificationStatus() async{
    final currentUser = FirebaseAuth.instance.currentUser;
    if( currentUser != null && currentUser.emailVerified) {
      Get.off(() => SucessScreen(image: ReadifyImages.successfulRegisterAnimation, title: ReadifyTexts.yourAccountCreatedTitle, subTitle: ReadifyTexts.yourAccountCreatedSubTitle, onPressed: ()=> AuthenticationRepository.instance.screenRedirect()));
    }
    }
    }


