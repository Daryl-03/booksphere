
import 'package:booksphere/modules/component_modules/library_component/domain/entities/user_history.dart';
import 'package:booksphere/modules/component_modules/library_component/domain/repository/library_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetUserHistoryByBookIdUseCase{
  final LibraryRepository _libraryRepository;

  GetUserHistoryByBookIdUseCase(this._libraryRepository);

  Future<UserHistory?> call(String bookId) async {
    return await _libraryRepository.getUserHistoryByBookId(bookId);
  }
}