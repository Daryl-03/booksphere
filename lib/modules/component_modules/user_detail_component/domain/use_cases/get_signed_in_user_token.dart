
import 'package:booksphere/modules/component_modules/user_detail_component/domain/repository/auth_repository.dart';
import 'package:booksphere/modules/component_modules/user_detail_component/domain/repository/user_data_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetSignedInUserTokenUseCase {
  final AuthRepository _userRepository;

  GetSignedInUserTokenUseCase(this._userRepository);

  Future<String?> call(bool forceRefresh) async {
    return await _userRepository.getSignedInUserToken(forceRefresh);
  }
}