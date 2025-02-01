import 'package:flutter/material.dart';
import 'package:fruits_hup/core/widget/custom_app_bar.dart';
import 'package:fruits_hup/features/auth/presentation/views/widget/signup_view_body.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  static const routeName = 'signup';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BuildAppBar(context, title: 'تسجيل حساب جديد'),
      body: SignupViewBody(),
    );
  }
}
