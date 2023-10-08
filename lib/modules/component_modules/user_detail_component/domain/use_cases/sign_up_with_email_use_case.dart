
import 'package:booksphere/modules/component_modules/user_detail_component/domain/entities/booksphere_user.dart';
import 'package:booksphere/modules/component_modules/user_detail_component/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SignUpWithEmailUseCase {

  const SignUpWithEmailUseCase(this._authRepository);

  final AuthRepository _authRepository;

  Future<bool> call(BooksphereUser user){
    return _authRepository.signUpWithEmail(user);
  }
}