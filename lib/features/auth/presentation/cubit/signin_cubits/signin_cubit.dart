import 'package:bloc/bloc.dart';
import 'package:fruits_hup/features/auth/domain/entites/user_entity.dart';
import 'package:fruits_hup/features/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit(this.authrepo) : super(SigninInitial());
  final AuthRepo authrepo;

  Future<void> signin(String email, String password) async {
    emit(SigninLoading());

    final result = await authrepo.signInWithEmailAndPassword(email, password);

    result.fold(
      (failure) => emit(SigninFailure(message: failure.message)),
      (userEntity) => emit(SigninSuccess(userEntity: userEntity)),
    );
  }
}
