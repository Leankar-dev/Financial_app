import 'dart:developer';

import 'package:financial_app/app/locator.dart';
import 'package:financial_app/common/constants/financial_app_colors.dart';
import 'package:financial_app/common/constants/financial_app_text_styles.dart';
import 'package:financial_app/common/constants/get_routes.dart';
import 'package:financial_app/common/utils/validator_custom.dart';
import 'package:financial_app/common/widgets/custom_circular_progress_indicator.dart';
import 'package:financial_app/common/widgets/custom_modal_botton_sheet.dart';
import 'package:financial_app/common/widgets/custom_text_form_field.dart';
import 'package:financial_app/common/widgets/multi_text_button.dart';
import 'package:financial_app/common/widgets/primary_button.dart';
import 'package:financial_app/features/login/login_controller.dart';
import 'package:financial_app/features/login/login_state.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();
  final _controller = locator.get<LoginController>();
  bool isHidden = true;

  @override
  void dispose() {
    _emailEC.dispose();
    _passwordEC.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(
      () {
        if (_controller.state is LoginStateLoadingState) {
          showDialog(
            context: context,
            builder: (context) => const CustomCircularProgressIndicator(),
          );
        }

        if (_controller.state is LoginStateSuccessState) {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Scaffold(
                body: Center(
                  child: Text('Nova tela'),
                ),
              ),
            ),
          );
        }
        if (_controller.state is LoginStateErrorState) {
          final error = _controller.state as LoginStateErrorState;
          Navigator.pop(context);
          customModalBottomSheet(
            context,
            content: error.message,
            buttonText: 'Tentar novamente.',
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Text(
            'Welcome Back!',
            textAlign: TextAlign.center,
            style: FinancialAppTextStyles.mediumText36
                .copyWith(color: FinancialAppColors.greenLightEnd),
          ),
          Image.asset('assets/images/LITTLE.png'),
          Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextFormField(
                  controller: _emailEC,
                  labelText: 'your email',
                  hintText: 'e-mail',
                  validator: ValidatorCustom.validateEmail,
                ),
                CustomTextFormField(
                  controller: _passwordEC,
                  labelText: 'your password',
                  hintText: '***********************',
                  suffixIcon: InkWell(
                    borderRadius: BorderRadius.circular(23.0),
                    onTap: () {
                      setState(() {
                        isHidden = !isHidden;
                      });
                    },
                    child: Icon(
                        isHidden ? Icons.visibility : Icons.visibility_off),
                  ),
                  obscureText: isHidden,
                  validator: ValidatorCustom.validatePassword,
                  helperText:
                      'Must have at least 8 characters, 1 capital letter and 1 number.',
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: PrimaryButtom(
              text: 'Login',
              onPressed: () {
                final valid = _formKey.currentState != null &&
                    _formKey.currentState!.validate();
                if (valid) {
                  _controller.doLogin(
                    email: _emailEC.text,
                    password: _passwordEC.text,
                  );
                } else {
                  log('Erro ao logar');
                }
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Don\'t have account?',
                style: FinancialAppTextStyles.smallText
                    .copyWith(color: FinancialAppColors.grey),
              ),
              MultiTextButton(
                onPressed: () => Navigator.popAndPushNamed(
                  context,
                  GetRoutes.registerPage,
                ),
                text: 'Register',
              ),
            ],
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
