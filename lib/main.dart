import 'package:flutter/material.dart';
import 'package:fruits_hup/core/helper_function/on_generate_routes.dart';
import 'package:fruits_hup/features/splash/presentation/views/splash_view.dart';

void main() {
  runApp(const FruitHup());
}

class FruitHup extends StatelessWidget {
  const FruitHup({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashView.routeName,
    );
  }
}
