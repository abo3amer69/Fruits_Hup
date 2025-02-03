import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hup/core/services/get_it_services.dart';
import 'package:fruits_hup/core/widget/custom_app_bar.dart';
import 'package:fruits_hup/features/auth/domain/repos/auth_repo.dart';
import 'package:fruits_hup/features/auth/presentation/cubit/signup_cubits/signup_cubit.dart';
import 'package:fruits_hup/features/auth/presentation/views/widget/signup_view_body.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  static const routeName = 'signup';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(
        getIt<AuthRepo>(),
      ),
      child: Scaffold(
        appBar: BuildAppBar(context, title: 'تسجيل حساب جديد'),
        body: const SignupViewBody(),
      ),
    );
  }
}
