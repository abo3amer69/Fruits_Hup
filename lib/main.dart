import 'package:flutter/material.dart';
import 'package:fruite_hup/features/splash/presentation/views/splash_view.dart';

void main() {
  runApp(const FruitHup());
}
class FruitHup extends StatelessWidget {
  const FruitHup({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashView(),
    );
  }
}