import 'package:Readify/data/repositories/authentication/authentication_repository.dart';
import 'package:Readify/data/repositories/user/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart'; // Import for PlatformException
import 'package:get/get.dart';

import '../../../utils/firebase_exceptions/firebase_exceptions.dart';
import '../../../utils/firebase_exceptions/format_exceptions.dart';
import '../../../utils/firebase_exceptions/platform_exceptions.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Function to save user data
  Future<void> saveUserRecords(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      throw ReadifyFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw ReadifyFormatException();
    } on PlatformException catch (e) {
      throw ReadifyPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  Future<UserModel> fetchUserDetails() async {
    try {
      final documentSnapshot = await _db
          .collection('Users')
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .get();
      if (documentSnapshot.exists) {
        return UserModel.fromSnapshot(documentSnapshot);
      } else {
        return UserModel.empty();
      }
    } on FirebaseException catch (e) {
      throw ReadifyFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw ReadifyFormatException();
    } on PlatformException catch (e) {
      throw ReadifyPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  Future<void> updateUserDetails(UserModel updateuser) async {
    try {
      await _db.collection("Users").doc(updateuser.id).set(updateuser.toJson());
    } on FirebaseException catch (e) {
      throw ReadifyFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw ReadifyFormatException();
    } on PlatformException catch (e) {
      throw ReadifyPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try {
      await _db
          .collection("Users")
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .update(json);
    } on FirebaseException catch (e) {
      throw ReadifyFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw ReadifyFormatException();
    } on PlatformException catch (e) {
      throw ReadifyPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  Future<void> removeUserDetails(String userId) async {
    try {
      await _db.collection("Users").doc(userId).delete();
    } on FirebaseException catch (e) {
      throw ReadifyFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw ReadifyFormatException();
    } on PlatformException catch (e) {
      throw ReadifyPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}
