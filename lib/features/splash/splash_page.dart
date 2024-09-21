import 'dart:async';

import 'package:financial_app/common/constants/financial_app_colors.dart';
import 'package:financial_app/common/constants/financial_app_text_styles.dart';
import 'package:financial_app/common/constants/get_routes.dart';
import 'package:financial_app/common/widgets/custom_circular_progress_indicator.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Timer init() {
    return Timer(
      const Duration(seconds: 2),
      navigateToOnboarding,
    );
  }

  void navigateToOnboarding() {
    Navigator.pushReplacementNamed(context, GetRoutes.onboardingPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: FinancialAppColors.greenGradient,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Financial APP',
              style: FinancialAppTextStyles.bigText
                  .copyWith(color: FinancialAppColors.whiteColor),
            ),
            const CustomCircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
