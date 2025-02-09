import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hup/core/errors/exception.dart';
import 'package:fruits_hup/core/errors/failure.dart';
import 'package:fruits_hup/core/services/database_services.dart';
import 'package:fruits_hup/core/services/firebase_auth_services.dart';
import 'package:fruits_hup/core/utils/backend_endpoint.dart';
import 'package:fruits_hup/features/auth/data/models/user_model.dart';
import 'package:fruits_hup/features/auth/domain/entites/user_entity.dart';
import 'package:fruits_hup/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthServices firebaseAuthServices;
  final DatabaseServices databaseServices;

  AuthRepoImpl(
      {required this.databaseServices, required this.firebaseAuthServices});
  @override
  Future<Either<Failure, UserEntity>> creatUserWithEmailAndPassword(
      String email, String password, String name) async {
    User? user;
    try {
      user = await firebaseAuthServices.createUserWithEmailAndPassword(
          email: email, password: password);

      var userEntity = UserEntity(
        name: name,
        email: email,
        uId: user.uid,
      );
      await addUserData(user: userEntity);
      return right(userEntity);
    } on CustomException catch (e) {
      await deletUser(user);
      return left(
        ServerFailure(e.message),
      );
    } catch (e) {
      await deletUser(user);
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

  Future<void> deletUser(User? user) async {
    if (user != null) {
      await firebaseAuthServices.deleteUser();
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
        'Exception in authrepoimpl.createuserwithemailandpasswordwithemail: ${e.toString()}',
      );
      return left(
        ServerFailure(
          'لقد حدث خطا مازالرجاء المحاوله مره اخرى.',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> siginWithGoogle() async {
    User? user;
    try {
      user = await firebaseAuthServices.signInWithGoogle();
      var userEntity = UserModel.fromFirebaseUser(user);
      await addUserData(user: userEntity);
      return right(userEntity);
    } catch (e) {
      await deletUser(user);
      log(
        'Exception in authrepoimpl.createuserwithemailandpasswordwithgoogle: ${e.toString()}',
      );
      return left(
        ServerFailure(
          'لقد حدث خطا مازالرجاء المحاوله مره اخرى.',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> siginWithFacebook() async {
    User? user;
    try {
      user = await firebaseAuthServices.signInWithFacebook();
      var userEntity = UserModel.fromFirebaseUser(user);
      await addUserData(user: userEntity);
      return right(userEntity);
    } catch (e) {
      await deletUser(user);
      log(
        'Exception in authrepoimpl.createuserwithemailandpasswordwithfacebook: ${e.toString()}',
      );
      return left(
        ServerFailure(
          'لقد حدث خطا مازالرجاء المحاوله مره اخرى.',
        ),
      );
    }
  }

  @override
  Future addUserData({required UserEntity user}) async {
    await databaseServices.addData(
        path: BackendEndPoint.addUserData, data: user.toMap());
  }
}
