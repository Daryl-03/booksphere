
import 'package:booksphere/modules/component_modules/user_detail_component/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SignOutUseCase {

  const SignOutUseCase(this._authRepository);

  final AuthRepository _authRepository;

  Future<void> call(){
    return _authRepository.signOut();
  }
}