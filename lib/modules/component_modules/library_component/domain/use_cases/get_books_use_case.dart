
import 'package:booksphere/modules/component_modules/library_component/domain/entities/book.dart';
import 'package:booksphere/modules/component_modules/library_component/domain/repository/library_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetBooksUseCase {
  final LibraryRepository _libraryRepository;

  GetBooksUseCase(this._libraryRepository);

  Future<List<Book>> call(int page, int size) async {
    return await _libraryRepository.getBooks(page, size);
  }
}