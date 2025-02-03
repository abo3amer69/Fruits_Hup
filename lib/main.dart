import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fruits_hup/core/helper_function/on_generate_routes.dart';
import 'package:fruits_hup/core/services/custom_bloc_observer.dart';
import 'package:fruits_hup/core/services/get_it_services.dart';
import 'package:fruits_hup/core/services/shared_preferences_singelton.dart';
import 'package:fruits_hup/core/utils/app_colors.dart';
import 'package:fruits_hup/features/splash/presentation/views/splash_view.dart';
import 'package:fruits_hup/firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = CustomBlocObserver();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  WidgetsFlutterBinding.ensureInitialized();

  await prefs.init();
  setupGetit();
  runApp(const FruitHup());
}

class FruitHup extends StatelessWidget {
  const FruitHup({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Cairo',
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryColor,
        ),
      ),
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: const Locale('ar'),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashView.routeName,
    );
  }
}
