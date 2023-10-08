
import 'package:booksphere/modules/component_modules/library_component/domain/entities/book.dart';
import 'package:booksphere/modules/component_modules/library_component/domain/repository/library_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SearchBookUseCase {
  final LibraryRepository _libraryRepository;

  SearchBookUseCase(this._libraryRepository);

  Future<List<Book>> call(String query, int page) async {
    return await _libraryRepository.getBooksBySearch(query, page);
  }
}