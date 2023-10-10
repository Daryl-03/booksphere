
import 'package:booksphere/modules/component_modules/library_component/domain/entities/user_history.dart';
import 'package:booksphere/modules/component_modules/library_component/domain/repository/library_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AddBookToHistoryUseCase {
  final LibraryRepository _libraryRepository;

  AddBookToHistoryUseCase(this._libraryRepository);

  Future<void> call(UserHistory userHistory) async {
    await _libraryRepository.addBookToHistory(userHistory);
  }
}