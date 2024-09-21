import 'package:financial_app/common/constants/financial_app_colors.dart';
import 'package:financial_app/common/constants/financial_app_text_styles.dart';
import 'package:financial_app/common/constants/get_routes.dart';
import 'package:financial_app/common/widgets/multi_text_button.dart';
import 'package:financial_app/common/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            Expanded(
              // flex: 2,
              child: Container(
                color: FinancialAppColors.iceWhite,
                child: Image.asset('assets/images/man.png'),
              ),
            ),
            Text(
              'Spend Smarter',
              style: FinancialAppTextStyles.mediumText36
                  .copyWith(color: FinancialAppColors.greenLightEnd),
            ),
            Text(
              'Save More',
              style: FinancialAppTextStyles.mediumText36
                  .copyWith(color: FinancialAppColors.greenLightEnd),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: PrimaryButtom(
                text: 'Get Started',
                onPressed: () {
                  Navigator.pushNamed(context, GetRoutes.registerPage);
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Allready have account?',
                  style: FinancialAppTextStyles.smallText
                      .copyWith(color: FinancialAppColors.grey),
                ),
                MultiTextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, GetRoutes.loginPage);
                  },
                  text: 'Log In',
                ),
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
