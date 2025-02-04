import 'package:flutter/material.dart';
import 'package:fruits_hup/constants.dart';
import 'package:fruits_hup/core/utils/app_colors.dart';
import 'package:fruits_hup/core/utils/app_images.dart';
import 'package:fruits_hup/core/utils/app_text_styles.dart';
import 'package:fruits_hup/core/widget/custom_button.dart';
import 'package:fruits_hup/core/widget/custom_text_form_field.dart';
import 'package:fruits_hup/features/auth/presentation/views/widget/dont_have_an_account_widget.dart';
import 'package:fruits_hup/features/auth/presentation/views/widget/or_divider.dart';
import 'package:fruits_hup/features/auth/presentation/views/widget/social_login_button.dart';

class SigninViewBody extends StatelessWidget {
  const SigninViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: KHorizentalPadding),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 24,
              ),
              CustomTextFormField(
                hintText: 'البريد الالكتروني',
                textInputType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                hintText: ' كلمة المرور',
                textInputType: TextInputType.visiblePassword,
                suffixicon: Icon(
                  Icons.remove_red_eye,
                  color: Color(0xffC9CECF),
                ),
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
                onPressed: () {},
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
                title: 'تسجيل  بواسطه جوجل',
                image: Assets.imagesGoogleIcon,
                onPressed: () {},
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
