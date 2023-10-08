
import 'package:booksphere/modules/component_modules/user_detail_component/domain/entities/booksphere_user.dart';
import 'package:booksphere/modules/component_modules/user_detail_component/domain/repository/user_data_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UpdateUserDataUseCase {
  final UserDataRepository _userRepository;

  UpdateUserDataUseCase(this._userRepository);

  Future<void> call(BooksphereUser user) async {
    await _userRepository.updateUserData(user);
  }
}