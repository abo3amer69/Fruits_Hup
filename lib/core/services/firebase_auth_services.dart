import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hup/core/errors/exception.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthServices {
  Future<User> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log('Exception in firebaseauthservices.createUserWithEmailAndPassword:${e.toString()} and code is ${e.code}');
      if (e.code == 'weak-password') {
        throw CustomException(message: 'الرقم السري ضعيف جداز');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
            message: 'لقد قمت بالتسجيل مسبقا. الرجاء تسجيل الدخول.');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(
          message: 'تاكد من الاتصال بالانترنت',
        );
      } else {
        throw CustomException(
            message: 'لقد حدث خطا مازالرجاء المحاوله مره اخرى.');
      }
    } catch (e) {
      log('Exception in firebaseauthservices.createUserWithEmailAndPassword:${e.toString()}');
      throw CustomException(
          message: 'لقد حدث خطا مازالرجاء المحاوله مره اخرى.');
    }
  }

  Future<User> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log('Exception in firebaseauthservices.signInWithEmailAndPassword:${e.toString()} and code is ${e.code} and message is ${e.message}');
      if (e.code == 'user-not-found') {
        throw CustomException(
            message: 'البريد الالكتروني او الرقم السري غير صحيحز');
      } else if (e.code == 'wrong-password') {
        throw CustomException(
            message: 'البريد الالكتروني او الرقم السري غير صحيحز');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(
          message: 'تاكد من الاتصال بالانترنت',
        );
      } else {
        throw CustomException(
            message: 'لقد حدث خطا مازالرجاء المحاوله مره اخرى.');
      }
    } catch (e) {
      log('Exception in firebaseauthservices.signInWithEmailAndPassword:${e.toString()}');
      throw CustomException(
          message: 'لقد حدث خطا مازالرجاء المحاوله مره اخرى.');
    }
  }

  Future<User> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }
}
