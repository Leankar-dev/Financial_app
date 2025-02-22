class ValidatorCustom {
  ValidatorCustom._();

  static String? validateName(String? value) {
    // final condition = RegExp(r"((\ *)[\wáéíóúñ]+(\ *)+)+");
    if (value != null && value.isEmpty) {
      return 'Esse campo não pode ser vazio.';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value != null && value.isEmpty) {
      return 'Esse campo não pode ser vazio.';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    final condition =
        RegExp(r"^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$");
    if (value != null && value.isEmpty) {
      return "Esse campo não pode ser vazio.";
    }
    if (value != null && !condition.hasMatch(value)) {
      return "Senha inválida. Digite uma senha válida.";
    }
    return null;
  }

  static String? validateConfirmPassword(
    String? passwordValue,
    String? confirmPasswordValue,
  ) {
    if (passwordValue != confirmPasswordValue) {
      return "As senhas são diferentes. Por favor, corrija para continuar.";
    }
    return null;
  }
}
