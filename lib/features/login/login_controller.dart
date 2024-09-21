import 'package:financial_app/features/login/login_state.dart';
import 'package:financial_app/services/auth_service.dart';
import 'package:flutter/material.dart';

class LoginController extends ChangeNotifier {
  final AuthService _service;

  LoginController(this._service);

  LoginState _state = LoginStateInitialState();

  LoginState get state => _state;

  void _changeState(LoginState newState) {
    _state = newState;
    notifyListeners();
  }

  Future<void> doLogin({
    // required String name,
    required String email,
    required String password,
  }) async {
    _changeState(LoginStateLoadingState());
    try {
      await _service.login(
        // name: name,
        email: email,
        password: password,
      );

      _changeState(LoginStateSuccessState());
    } catch (e) {
      _changeState(LoginStateErrorState(e.toString()));
    }
  }
}
