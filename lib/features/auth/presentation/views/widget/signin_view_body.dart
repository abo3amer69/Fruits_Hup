import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hup/constants.dart';
import 'package:fruits_hup/core/utils/app_colors.dart';
import 'package:fruits_hup/core/utils/app_images.dart';
import 'package:fruits_hup/core/utils/app_text_styles.dart';
import 'package:fruits_hup/core/widget/custom_button.dart';
import 'package:fruits_hup/core/widget/custom_text_form_field.dart';
import 'package:fruits_hup/core/widget/password_field.dart';
import 'package:fruits_hup/features/auth/presentation/cubit/signin_cubits/signin_cubit.dart';
import 'package:fruits_hup/features/auth/presentation/views/widget/dont_have_an_account_widget.dart';
import 'package:fruits_hup/features/auth/presentation/views/widget/or_divider.dart';
import 'package:fruits_hup/features/auth/presentation/views/widget/social_login_button.dart';

class SigninViewBody extends StatefulWidget {
  const SigninViewBody({super.key});

  @override
  State<SigninViewBody> createState() => _SigninViewBodyState();
}

class _SigninViewBodyState extends State<SigninViewBody> {
  late String email, password;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: KHorizentalPadding),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              SizedBox(
                height: 24,
              ),
              CustomTextFormField(
                onSaved: (value) {
                  email = value!;
                },
                hintText: 'البريد الالكتروني',
                textInputType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 16,
              ),
              passwordfield(
                onSaved: (value) {
                  password = value!;
                },
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'نسيت كلمة المرور؟',
                    style: TextStyles.semiBold13.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 33,
              ),
              CustomButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    context.read<SigninCubit>().signin(email, password);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    // setState(() {});
                  }
                },
                text: 'تسجيل الدخول',
              ),
              const SizedBox(
                height: 33,
              ),
              const DontHaveAnAccountWidget(),
              SizedBox(
                height: 33,
              ),
              const OrDivider(),
              SizedBox(
                height: 16,
              ),
              SocialLoginButton(
                onPressed: () {
                  context.read<SigninCubit>().siginWithGoogle();
                },
                title: 'تسجيل  بواسطه جوجل',
                image: Assets.imagesGoogleIcon,
              ),
              SizedBox(
                height: 16,
              ),
              SocialLoginButton(
                title: 'تسجيل  بواسطه ابل',
                image: Assets.imagesApplIcon,
                onPressed: () {},
              ),
              SizedBox(
                height: 16,
              ),
              SocialLoginButton(
                title: 'تسجيل  بواسطه فيسبوك',
                image: Assets.imagesFacebookIcon,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
