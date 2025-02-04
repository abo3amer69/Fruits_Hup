import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'custom_text_form_field.dart';

class passwordfield extends StatefulWidget {
  const passwordfield({
    super.key,
    this.onSaved,
  });

  @override
  final void Function(String?)? onSaved;

  @override
  State<passwordfield> createState() => _passwordfieldState();
}

class _passwordfieldState extends State<passwordfield> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      obscureText: obscureText,
      onSaved: (value) {
        widget.onSaved!(value);
      },
      suffixicon: GestureDetector(
        onTap: () {
          obscureText = !obscureText;
          setState(() {});
        },
        child: obscureText
            ? const Icon(
                Icons.remove_red_eye,
                color: Color(0xffC9CECF),
              )
            : Icon(
                Icons.visibility_off,
                color: Color(0xffC9CECF),
              ),
      ),
      hintText: ' كلمة المرور',
      textInputType: TextInputType.visiblePassword,
    );
  }
}
