import 'package:financial_app/common/models/user_model.dart';

abstract interface class AuthService {
  Future<UserModel> register({
    String? name,
    required String email,
    required String password,
  });

  Future<UserModel> login({
    required String email,
    required String password,
  });
}
