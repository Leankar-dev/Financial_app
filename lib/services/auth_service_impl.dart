import 'package:financial_app/common/models/user_model.dart';

import './auth_service.dart';

class AuthServiceImpl implements AuthService {
  @override
  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    await Future.delayed(const Duration(seconds: 2));
    try {
      if (password.startsWith('123')) {
        throw Exception();
      }
      return UserModel(
        id: email.hashCode,
        email: email,
      );
    } catch (e) {
      if (password.startsWith('123')) {
        throw '  Erro ao Logar. Tente novamente.';
      }
      throw 'Não foi possivel criar sua conta neste momento. Tente novamente mais tarde.';
    }
  }

  @override
  Future<UserModel> register({
    String? name,
    required String email,
    required String password,
  }) async {
    await Future.delayed(const Duration(seconds: 2));
    try {
      if (password.startsWith('123')) {
        throw Exception();
      }
      return UserModel(
        id: email.hashCode,
        name: name,
        email: email,
      );
    } catch (e) {
      if (password.startsWith('123')) {
        throw '  Password inseguro. Digite um password forte.';
      }
      throw 'Não foi possivel criar sua conta neste momento. Tente novamente mais tarde.';
    }
  }
}
