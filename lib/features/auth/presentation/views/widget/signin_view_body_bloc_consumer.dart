import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      listener: (context, state) {},
      builder: (context, state) {
        return CustomProgressHud(
            isLoading: state is SigninLoading ? true : false,
            child: const SigninViewBody());
      },
    );
  }
}
