import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hup/core/helper_function/build_error_bar.dart';
import 'package:fruits_hup/core/widget/custom_progress_hud.dart';
import 'package:fruits_hup/features/auth/presentation/cubit/signin_cubits/signin_cubit.dart';
import 'package:fruits_hup/features/auth/presentation/views/widget/signin_view_body.dart';

class signinViewBodyBlocConsumer extends StatelessWidget {
  const signinViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninCubit, SigninState>(
      listener: (context, state) {
        if (state is SigninSuccess) {}
        if (state is SigninFailure) {
          buildErrorBar(context, state.message);
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
            isLoading: state is SigninLoading ? true : false,
            child: const SigninViewBody());
      },
    );
  }
}
