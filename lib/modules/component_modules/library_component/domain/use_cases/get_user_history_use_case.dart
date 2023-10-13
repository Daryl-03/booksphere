
import 'package:booksphere/modules/component_modules/library_component/domain/entities/user_history.dart';
import 'package:booksphere/modules/component_modules/library_component/domain/repository/library_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetUserHistoryUseCase {
  final LibraryRepository _libraryRepository;

  GetUserHistoryUseCase(this._libraryRepository);

  Future<List<UserHistory>> call() {
    return _libraryRepository.getUserHistory();
  }
}