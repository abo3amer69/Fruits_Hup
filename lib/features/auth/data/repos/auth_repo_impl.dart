import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hup/core/errors/exception.dart';
import 'package:fruits_hup/core/errors/failure.dart';
import 'package:fruits_hup/core/services/firebase_auth_services.dart';
import 'package:fruits_hup/features/auth/data/models/user_model.dart';
import 'package:fruits_hup/features/auth/domain/entites/user_entity.dart';
import 'package:fruits_hup/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthServices firebaseAuthServices;

  AuthRepoImpl({required this.firebaseAuthServices});
  @override
  Future<Either<Failure, UserEntity>> creatUserWithEmailAndPassword(
      String email, String password, String name) async {
    try {
      var user = await firebaseAuthServices.createUserWithEmailAndPassword(
          email: email, password: password);
      return right(
        UserModel.fromFirebaseUser(user),
      );
    } on CustomException catch (e) {
      return left(
        ServerFailure(e.message),
      );
    } catch (e) {
      log(
        'Exception in authrepoimpl.createuserwithemailandpassword: ${e.toString()}',
      );
      return left(
        ServerFailure(
          'لقد حدث خطا مازالرجاء المحاوله مره اخرى.',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      var user = await firebaseAuthServices.signInWithEmailAndPassword(
          email: email, password: password);
      return right(
        UserModel.fromFirebaseUser(user),
      );
    } on CustomException catch (e) {
      return left(
        ServerFailure(e.message),
      );
    } catch (e) {
      log(
        'Exception in authrepoimpl.createuserwithemailandpassword: ${e.toString()}',
      );
      return left(
        ServerFailure(
          'لقد حدث خطا مازالرجاء المحاوله مره اخرى.',
        ),
      );
    }
  }
}
