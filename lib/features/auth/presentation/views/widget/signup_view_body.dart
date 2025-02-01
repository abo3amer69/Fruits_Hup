import 'package:flutter/material.dart';
import 'package:fruits_hup/constants.dart';
import 'package:fruits_hup/core/widget/custom_button.dart';
import 'package:fruits_hup/core/widget/custom_text_form_field.dart';
import 'package:fruits_hup/features/auth/presentation/views/widget/have_an_account.dart';
import 'package:fruits_hup/features/auth/presentation/views/widget/terms_and_condition.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: KHorizentalPadding),
        child: Column(
          children: [
            SizedBox(
              height: 24,
            ),
            CustomTextFormField(
              hintText: 'الاسم كامل',
              textInputType: TextInputType.name,
            ),
            SizedBox(
              height: 16,
            ),
            CustomTextFormField(
              hintText: ' البريد الالكتروني',
              textInputType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: 16,
            ),
            CustomTextFormField(
              suffixicon: Icon(
                Icons.remove_red_eye,
                color: Color(0xffC9CECF),
              ),
              hintText: ' كلمة المرور',
              textInputType: TextInputType.visiblePassword,
            ),
            SizedBox(
              height: 16,
            ),
            TermsAndConditionWidget(),
            SizedBox(
              height: 30,
            ),
            CustomButton(
              onPressed: () {},
              text: 'إنشاء حساب جديد',
            ),
            SizedBox(
              height: 26,
            ),
            HaveAnAccountWidget(),
          ],
        ),
      ),
    );
  }
}
