
class RegisterState {

  String? error;
  bool? isAuthenticating;

  RegisterState._();

  factory RegisterState.initial() {
    return RegisterState._()
      ..error = ''
      ..isAuthenticating = false;
  }

  RegisterState copyWith({
    String? error,
    bool? isAuthenticating,
  }) {
    return RegisterState._()
      ..error = error ?? this.error
      ..isAuthenticating = isAuthenticating ?? this.isAuthenticating;
  }
}