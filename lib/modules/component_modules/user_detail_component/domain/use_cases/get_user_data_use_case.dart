
import 'package:booksphere/modules/component_modules/user_detail_component/domain/entities/booksphere_user.dart';
import 'package:booksphere/modules/component_modules/user_detail_component/domain/repository/user_data_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetUserDataUseCase{
  final UserDataRepository _userRepository;

  GetUserDataUseCase(this._userRepository);

  Future<BooksphereUser?> call() async {
    return _userRepository.getUserData();
  }
}