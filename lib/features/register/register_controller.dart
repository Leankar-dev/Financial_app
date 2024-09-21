import 'package:financial_app/features/register/register_state.dart';
import 'package:financial_app/services/auth_service.dart';
import 'package:flutter/material.dart';

class RegisterController extends ChangeNotifier {
  final AuthService _service;

  RegisterController(this._service);

  RegisterState _state = RegisterInitialState();

  RegisterState get state => _state;

  void _changeState(RegisterState newState) {
    _state = newState;
    notifyListeners();
  }

  Future<void> doRegister({
    required String name,
    required String email,
    required String password,
  }) async {
    _changeState(RegisterLoadingState());
    try {
      await _service.register(
        name: name,
        email: email,
        password: password,
      );

      _changeState(RegisterSuccessState());
    } catch (e) {
      _changeState(RegisterErrorState(e.toString()));
    }
  }
}
