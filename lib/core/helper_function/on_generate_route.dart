import 'package:flutter/material.dart';
import 'package:fruite_hup/features/auth/presentation/views/login_view.dart';
import 'package:fruite_hup/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:fruite_hup/features/splash/presentation/views/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());

    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (context) => const OnBoardingView());

    case LoginView.routeName:
      return MaterialPageRoute(builder: (context) => const LoginView());

    default:
      return MaterialPageRoute(builder: (context) => Scaffold());
  }
}
