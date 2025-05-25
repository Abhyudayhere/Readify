import 'package:Readify/data/repositories/user/user_repository.dart';
import 'package:Readify/features/authentication/screens/login/login.dart';
import 'package:Readify/features/authentication/screens/onboarding/onboarding.dart';
import 'package:Readify/features/authentication/screens/signup/verify_email.dart';
import 'package:Readify/navigation_menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../utils/firebase_exceptions/firebase_auth_exceptions.dart';
import '../../../utils/firebase_exceptions/firebase_exceptions.dart';
import '../../../utils/firebase_exceptions/format_exceptions.dart';
import '../../../utils/firebase_exceptions/platform_exceptions.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  User? get authUser => _auth.currentUser;


  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => const NavigationMenu());
      } else {
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email));
      }
    } else {
      deviceStorage.writeIfNull('IsFirstTime', true);
      deviceStorage.read('IsFirstTime') != true
          ? Get.offAll(() => const LoginScreen())
          : Get.offAll(() => OnBoardingScreen());
    }
  }

  Future<UserCredential> loginWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw ReadifyFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw ReadifyFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw ReadifyFormatException();
    } on PlatformException catch (e) {
      throw ReadifyPlatformException(e.code).message;
    } catch (e) {
      debugPrint("🔥 Unexpected error during auth: $e");
      throw e.toString();
    }
  }

  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw ReadifyFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw ReadifyFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw ReadifyFormatException();
    } on PlatformException catch (e) {
      throw ReadifyPlatformException(e.code).message;
    } catch (e) {
      debugPrint("🔥 Unexpected error during auth: $e");
      throw e.toString();
    }
  }

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw ReadifyFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw ReadifyFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw ReadifyFormatException();
    } on PlatformException catch (e) {
      throw ReadifyPlatformException(e.code).message;
    } catch (e) {
      debugPrint("🔥 Unexpected error during auth: $e");
      throw e.toString();
    }
  }

  Future<void> sendEmailVerification() async {
    try {
      final user = _auth.currentUser;
      if (user != null && !user.emailVerified) {
        await user.sendEmailVerification();
      } else {
        throw 'User not found or already verified.';
      }
    } catch (e) {
      debugPrint("🔥 Email verification error: $e");
      throw e.toString();
    }
  }

  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
    } on FirebaseAuthException catch (e) {
      throw ReadifyFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw ReadifyFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw ReadifyFormatException();
    } on PlatformException catch (e) {
      throw ReadifyPlatformException(e.code).message;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> reAuthenticateWithEmailAndPassword(String email, String password) async {
    try {
      AuthCredential credential = EmailAuthProvider.credential(email: email, password: password);
      await _auth.currentUser!.reauthenticateWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw ReadifyFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw ReadifyFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw ReadifyFormatException();
    } on PlatformException catch (e) {
      throw ReadifyPlatformException(e.code).message;
    } catch (e) {
      debugPrint("🔥 Unexpected error during auth: $e");
      throw e.toString();
    }
  }

  Future<void> deleteAccount() async {
    try {
      await UserRepository.instance.removeUserDetails(_auth.currentUser!.uid);
      await _auth.currentUser?.delete();
    } on FirebaseAuthException catch (e) {
      throw ReadifyFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw ReadifyFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw ReadifyFormatException();
    } on PlatformException catch (e) {
      throw ReadifyPlatformException(e.code).message;
    } catch (e) {
      throw e.toString();
    }
  }

}