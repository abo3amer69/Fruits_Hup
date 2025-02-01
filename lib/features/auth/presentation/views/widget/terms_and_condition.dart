import 'package:flutter/material.dart';
import 'package:fruits_hup/constants.dart';
import 'package:fruits_hup/core/utils/app_text_styles.dart';
import 'package:fruits_hup/features/auth/presentation/views/widget/custom_check_box.dart';

import '../../../../../core/utils/app_colors.dart';

class TermsAndConditionWidget extends StatefulWidget {
  const TermsAndConditionWidget({super.key});

  @override
  State<TermsAndConditionWidget> createState() =>
      _TermsAndConditionWidgetState();
}

class _TermsAndConditionWidgetState extends State<TermsAndConditionWidget> {
  bool isTermesAccepted = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckBox(
          isChecked: isTermesAccepted,
          onChecked: (value) {
            isTermesAccepted = value;
            setState(() {});
          },
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'من خلال إنشاء حساب ، فإنك توافق على ',
                  style: TextStyles.semiBold13.copyWith(
                    color: const Color(0xFF949D9E),
                  ),
                ),
                TextSpan(
                  text: 'الشروط والأحكام',
                  style: TextStyles.semiBold13.copyWith(
                    color: AppColors.lightprimaryColor,
                  ),
                ),
                const TextSpan(
                  text: ' ',
                  style: TextStyles.semiBold13,
                ),
                TextSpan(
                  text: 'الخاصة',
                  style: TextStyles.semiBold13.copyWith(
                    color: AppColors.lightprimaryColor,
                  ),
                ),
                const TextSpan(
                  text: ' ',
                  style: TextStyles.semiBold13,
                ),
                TextSpan(
                  text: 'بنا',
                  style: TextStyles.semiBold13
                      .copyWith(color: AppColors.lightprimaryColor),
                ),
              ],
            ),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
}
