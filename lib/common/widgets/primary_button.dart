import 'package:financial_app/common/constants/financial_app_colors.dart';
import 'package:financial_app/common/constants/financial_app_text_styles.dart';
import 'package:flutter/material.dart';

class PrimaryButtom extends StatelessWidget {
  // final void Function()? onTap;   - ou conforme abaixo:
  final VoidCallback? onPressed;
  final String text;

  const PrimaryButtom({
    super.key,
    this.onPressed,
    required this.text,
  });

  final BorderRadius _borderRadius = const BorderRadius.all(
    Radius.circular(25.0),
  );

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Ink(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: _borderRadius,
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: onPressed != null
                ? FinancialAppColors.greenGradient
                : FinancialAppColors.greyGradient,
          ),
        ),
        child: InkWell(
          borderRadius: _borderRadius,
          onTap: onPressed,
          child: Align(
            child: Text(
              text,
              style: FinancialAppTextStyles.mediumText18
                  .copyWith(color: FinancialAppColors.whiteColor),
            ),
          ),
        ),
      ),
    );
  }
}
