
import 'package:Readify/commons/widgets/loader/loaders.dart';
import 'package:Readify/data/repositories/authentication/authentication_repository.dart';
import 'package:Readify/data/repositories/user/user_repository.dart';
import 'package:Readify/features/authentication/screens/signup/verify_email.dart';
import 'package:Readify/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../commons/widgets/network/network_manager.dart';
import '../../../../data/repositories/user/user_model.dart';
import '../../../../utils/popups/full_screen_loader.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  final hidePassword = true.obs;
  final privacyPolicy = true.obs;

  final email = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();

  final GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  void signup() async {
    try {
      if (!signupFormKey.currentState!.validate()) return;

      if (!privacyPolicy.value) {
        ReadifyLoaders.warningSnackBar(
          title: 'Accept Privacy Policy',
          message: 'To create an account, you must accept the Privacy Policy & Terms of Use.',
        );
        return;
      }

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        ReadifyLoaders.errorSnackBar(
          title: 'No Internet',
          message: 'Please check your internet connection and try again.',
        );
        return;
      }

      ReadifyFullScreenLoader.openLoadingDialog(
        'We are processing your information...',
        ReadifyImages.decorAnimation,
      );

      final userCredential = await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());

      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        username: userName.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecords(newUser);

      ReadifyFullScreenLoader.stopLoading();

      ReadifyLoaders.successSnackBar(
        title: 'Congratulations',
        message: 'Your account has been created! Verify your email to continue.',
      );

      await Future.delayed(Duration(seconds: 2));
      Get.to(() => VerifyEmailScreen(email: email.text.trim()));
    } catch (e) {
      ReadifyFullScreenLoader.stopLoading();
      debugPrint("🔥 Signup error: $e");
      ReadifyLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
