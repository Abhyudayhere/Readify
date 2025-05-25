import 'package:Readify/features/personalization/controllers/user_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../commons/widgets/loader/loaders.dart';
import '../../../commons/widgets/network/network_manager.dart';
import '../../../data/repositories/authentication/authentication_repository.dart';
import '../../../data/repositories/user/user_repository.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/popups/full_screen_loader.dart';
import '../../authentication/screens/password_configuration/reset_password.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();   
  final lastName = TextEditingController();
  final userController = UserController.instance;    
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    initializeNames();  // Fetches and sets the user's first and last name into the text controllers
    super.onInit();     // Calls the base class's onInit
  }

  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async{
    try{
      ReadifyFullScreenLoader.openLoadingDialog('We are Updating Your Information...', ReadifyImages.decorAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected) {ReadifyFullScreenLoader.stopLoading(); return;}

      if(!updateUserNameFormKey.currentState!.validate()){
        ReadifyFullScreenLoader.stopLoading();
        return;
      }

      Map<String, dynamic> name = {'FirstName' : firstName.text.trim(),'LastName' : lastName.text.trim()};
      await userRepository.updateSingleField(name);

      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      ReadifyFullScreenLoader.stopLoading();

      ReadifyLoaders.successSnackBar(title: 'Name Changed Sucessfully', message: 'Now New Name Will Be Displayed Soon...'.tr);

    } catch(e){
      ReadifyFullScreenLoader.stopLoading();
      ReadifyLoaders.errorSnackBar(title: 'Aw Snap', message: e.toString());
    }
  }

}