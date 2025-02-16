import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruite_hup/constants.dart';
import 'package:fruite_hup/core/services/shared_preferences_singleton.dart';
import 'package:fruite_hup/core/utils/app_images.dart';
import 'package:fruite_hup/features/auth/presentation/views/login_view.dart';
import 'package:fruite_hup/features/on_boarding/presentation/views/on_boarding_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    exCuteNavigation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SvgPicture.asset(Assets.assetsImagesPlant),
          ],
        ),
        SvgPicture.asset(Assets.assetsImagesLogo),
        SvgPicture.asset(
          Assets.assetsImagesSplashBottom,
          fit: BoxFit.fill,
        ),
      ],
    );
  }

  void exCuteNavigation() {
    bool isOnBoardingViewSeen = Prefs.getBool(kIsOnBoardingViewSeen);
    Future.delayed(const Duration(seconds: 3), () {
      if (isOnBoardingViewSeen) {
  Navigator.pushReplacementNamed(context, LoginView.routeName);
}
else{
  Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
}
    });
  }
}
