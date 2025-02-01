import 'package:flutter/material.dart';
import 'package:fruits_hup/constants.dart';
import 'package:fruits_hup/core/widget/custom_text_form_field.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: KHorizentalPadding),
      child: const SingleChildScrollView(
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
              suffixicon: Icon(Icons.remove_red_eye),
            ),
          ],
        ),
      ),
    );
  }
}
