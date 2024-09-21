import 'package:financial_app/common/constants/financial_app_colors.dart';
import 'package:flutter/material.dart';

final defaultTheme = ThemeData(
  inputDecorationTheme: const InputDecorationTheme(
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: FinancialAppColors.blueColor,
      ),
    ),
  ),
  useMaterial3: true,
);
