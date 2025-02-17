import 'package:flutter/material.dart';
import 'package:fruite_hup/constants.dart';
import 'package:fruite_hup/core/utils/app_colors.dart';
import 'package:fruite_hup/core/utils/app_images.dart';
import 'package:fruite_hup/core/utils/app_text_styles.dart';
import 'package:fruite_hup/core/widgets/custom_button.dart';
import 'package:fruite_hup/core/widgets/custom_text_field.dart';
import 'package:fruite_hup/features/auth/presentation/views/widgets/dont_have_an_account_widget.dart';
import 'package:fruite_hup/features/auth/presentation/views/widgets/or_divider.dart';
import 'package:fruite_hup/features/auth/presentation/views/widgets/social_login_button.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: kHorizintalPadding,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 24,
              ),
              CustomTextFormField(
                hintText: 'البريد الإلكتروني',
                textInputType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                suffixIcon: Icon(
                  Icons.remove_red_eye,
                  color: Color(0xffC9CECF),
                ),
                hintText: 'كلمة المرور',
                textInputType: TextInputType.visiblePassword,
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
                      color: AppColors.lightPrimaryColor,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 33,
              ),
              CustomButton(
                onPressed: () {},
                text: 'تسجيل الدخول',
              ),
              SizedBox(
                height: 33,
              ),
              DontHaveAnAccountWidget(),
              SizedBox(
                height: 33,
              ),
              
              OrDivider(),
              SizedBox(
                height: 16,
              ),
              SocialLoginButton(
                onPressed: () {},
                image: Assets.assetsImagesGoogleIcon,
                title: 'تسجيل الدخول باستخدام جوجل',
              ),
              SizedBox(
                height: 16,
              ),
              SocialLoginButton(
                onPressed: () {},
                image: Assets.assetsImagesAppIcon,
                title: 'تسجيل الدخول باستخدام ابل',
              ),
              SizedBox(
                height: 16,
              ),
              SocialLoginButton(
                onPressed: () {},
                image: Assets.assetsImagesFacebookIcon,
                title: 'تسجيل الدخول باستخدام فيسبوك',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
