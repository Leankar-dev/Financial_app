abstract class LoginState {}

class LoginStateInitialState extends LoginState {}

class LoginStateLoadingState extends LoginState {}

class LoginStateSuccessState extends LoginState {}

class LoginStateErrorState extends LoginState {
  final String message;

  LoginStateErrorState(this.message);
}
