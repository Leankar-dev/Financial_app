import 'package:financial_app/common/constants/get_routes.dart';
import 'package:financial_app/common/themes/default_theme.dart';
import 'package:financial_app/features/login/login_page.dart';
import 'package:financial_app/features/onboarding/onboarding_page.dart';
import 'package:financial_app/features/register/register_page.dart';
import 'package:financial_app/features/splash/splash_page.dart';
import 'package:flutter/material.dart';

class FinancialApp extends StatelessWidget {
  const FinancialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Financial App',
      theme: defaultTheme,
      initialRoute: GetRoutes.initial,
      routes: {
        GetRoutes.initial: (context) => const SplashPage(),
        GetRoutes.onboardingPage: (context) => const OnboardingPage(),
        GetRoutes.registerPage: (context) => const RegisterPage(),
        GetRoutes.loginPage: (context) => const LoginPage(),
      },
    );
  }
}
