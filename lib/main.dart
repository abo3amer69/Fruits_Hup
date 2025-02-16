import 'package:flutter/material.dart';
import 'package:fruite_hup/features/splash/presentation/views/splash_view.dart';

import 'core/helper_function/on_generate_route.dart';

void main() {
  runApp(const FruitHup());
}
class FruitHup extends StatelessWidget {
  const FruitHup({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashView.routeName,
      debugShowCheckedModeBanner: false,
      home: SplashView(),
    );
  }
}