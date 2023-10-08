import 'package:booksphere/modules/component_modules/user_detail_component/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SignInWithEmailUseCase {

  const SignInWithEmailUseCase(this._authRepository);

  final AuthRepository _authRepository;

  Future<bool> call(String email, String password) {
    return _authRepository.signInWithEmail(email, password);
  }

}
