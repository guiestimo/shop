class AuthException implements Exception {
  static const Map<String, String> errors = {
    "EMAIL_EXISTS": "E-mail já existente!",
    "OPERATION_NOT_ALLOWED": "Operação não permitida!",
    "TOO_MANY_ATTEMPTS_TRY_LATER": "Muitas tentativas, tente mais tarde!",
    "EMAIL_NOT_FOUND": "E-mail e/ou senha inválidos!",
    "INVALID_PASSWORD": "E-mail e/ou senha inválidos!",
    "USER_DISABLED": "Usuário desativado!",
  };

  final String key;

  const AuthException(this.key);

  @override
  String toString() {
    if (errors.containsKey(key)) {
      return errors[key];
    } else {
      return "Ocorreu um erro na autenticação.";
    }
  }
}
