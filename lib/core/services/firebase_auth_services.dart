import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hup/core/errors/exception.dart';

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
      if (e.code == 'weak-password') {
        throw CustomException(message: 'الرقم السري ضعيف جداز');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
            message: 'لقد قمت بالتسجيل مسبقا. الرجاء تسجيل الدخول.');
      } else {
        throw CustomException(
            message: 'لقد حدث خطا مازالرجاء المحاوله مره اخرى.');
      }
    } catch (e) {
      throw CustomException(
          message: 'لقد حدث خطا مازالرجاء المحاوله مره اخرى.');
    }
  }
}
