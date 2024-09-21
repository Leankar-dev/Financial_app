import 'package:financial_app/common/constants/financial_app_colors.dart';
import 'package:financial_app/common/constants/financial_app_text_styles.dart';
import 'package:financial_app/common/widgets/primary_button.dart';
import 'package:flutter/material.dart';

Future<void> customModalBottomSheet(BuildContext context,
    {required String content, required String buttonText}) {
  return showModalBottomSheet<void>(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(38.0),
        topRight: Radius.circular(38.0),
      ),
    ),
    builder: (BuildContext context) {
      return Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(38.0),
            topRight: Radius.circular(38.0),
          ),
        ),
        height: 200,
        // color: Colors.amber,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 17,
                ),
                child: Text(
                  content,
                  style: FinancialAppTextStyles.mediumText20
                      .copyWith(color: FinancialAppColors.greenLightInit),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 32,
                ),
                child: PrimaryButtom(
                  text: buttonText,
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              // ElevatedButton(
              //   child: const Text('Tentar novamente.'),
              //   onPressed: () => Navigator.pop(context),
              // ),
            ],
          ),
        ),
      );
    },
  );
}
