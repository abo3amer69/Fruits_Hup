import 'package:flutter/material.dart';
import 'package:fruits_hup/constants.dart';
import 'package:fruits_hup/core/utils/app_text_styles.dart';

import '../../../../../core/utils/app_colors.dart';

class TermsAndConditionWidget extends StatelessWidget {
  const TermsAndConditionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(14, 0),
      child: Row(
        children: [
          Checkbox(
            value: false,
            onChanged: (value) {},
          ),
          SizedBox(
            width: MediaQuery.sizeOf(context).width -
                (KHorizentalPadding * 2) -
                48,
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
      ),
    );
  }
}
