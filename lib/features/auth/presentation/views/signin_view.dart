import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hup/core/services/get_it_services.dart';
import 'package:fruits_hup/core/utils/app_text_styles.dart';
import 'package:fruits_hup/core/widget/custom_app_bar.dart';
import 'package:fruits_hup/features/auth/domain/repos/auth_repo.dart';
import 'package:fruits_hup/features/auth/presentation/cubit/signin_cubits/signin_cubit.dart';
import 'package:fruits_hup/features/auth/presentation/views/widget/signin_view_body.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});

  static const routeName = 'login';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninCubit(
        getIt.get<AuthRepo>(),
      ),
      child: Scaffold(
        appBar: BuildAppBar(context, title: 'تسجيل الدخول'),
        body: SigninViewBody(),
      ),
    );
  }
}
