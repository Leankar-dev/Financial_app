import 'dart:developer';

import 'package:financial_app/app/locator.dart';
import 'package:financial_app/common/constants/financial_app_colors.dart';
import 'package:financial_app/common/constants/financial_app_text_styles.dart';
import 'package:financial_app/common/constants/get_routes.dart';
import 'package:financial_app/common/utils/uppercase_text_input_formatter.dart';
import 'package:financial_app/common/utils/validator_custom.dart';
import 'package:financial_app/common/widgets/custom_circular_progress_indicator.dart';
import 'package:financial_app/common/widgets/custom_modal_botton_sheet.dart';
import 'package:financial_app/common/widgets/custom_text_form_field.dart';
import 'package:financial_app/common/widgets/multi_text_button.dart';
import 'package:financial_app/common/widgets/primary_button.dart';
import 'package:financial_app/features/register/register_controller.dart';
import 'package:financial_app/features/register/register_state.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameEC = TextEditingController();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();
  // final _controller = RegisterController(AuthServiceImpl());
  final _controller = locator.get<RegisterController>();
  bool isHidden = true;

  @override
  void dispose() {
    _nameEC.dispose();
    _emailEC.dispose();
    _passwordEC.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(
      () {
        if (_controller.state is RegisterLoadingState) {
          showDialog(
            context: context,
            builder: (context) => const CustomCircularProgressIndicator(),
          );
        }

        if (_controller.state is RegisterSuccessState) {
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
        if (_controller.state is RegisterErrorState) {
          final error = _controller.state as RegisterErrorState;
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
            'Spend Smarter',
            textAlign: TextAlign.center,
            style: FinancialAppTextStyles.mediumText36
                .copyWith(color: FinancialAppColors.greenLightEnd),
          ),
          Text(
            'Save More',
            textAlign: TextAlign.center,
            style: FinancialAppTextStyles.mediumText36
                .copyWith(color: FinancialAppColors.greenLightEnd),
          ),
          Image.asset('assets/images/HOMETODOLIST.png'),
          Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextFormField(
                  controller: _nameEC,
                  labelText: 'your name',
                  hintText: 'Name ',
                  inputFormatters: [UppercaseTextInputFormatter()],
                  validator: ValidatorCustom.validateName,
                ),
                CustomTextFormField(
                  controller: _emailEC,
                  labelText: 'your email',
                  hintText: 'e-mail',
                  validator: ValidatorCustom.validateEmail,
                ),
                CustomTextFormField(
                  controller: _passwordEC,
                  labelText: 'choose your password',
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
                CustomTextFormField(
                  labelText: 'confirm your password',
                  hintText: '*****************',
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
                  validator: (value) => ValidatorCustom.validateConfirmPassword(
                    _passwordEC.text,
                    value,
                  ),
                  // onEditingComplete: _onSignUpButtonPressed,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: PrimaryButtom(
              text: 'Sign Up',
              onPressed: () {
                final valid = _formKey.currentState != null &&
                    _formKey.currentState!.validate();
                if (valid) {
                  _controller.doRegister(
                    name: _nameEC.text,
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
                'Allready have account?',
                style: FinancialAppTextStyles.smallText
                    .copyWith(color: FinancialAppColors.grey),
              ),
              MultiTextButton(
                onPressed: () {
                  Navigator.popAndPushNamed(context, GetRoutes.loginPage);
                },
                text: 'Log In',
              ),
            ],
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
