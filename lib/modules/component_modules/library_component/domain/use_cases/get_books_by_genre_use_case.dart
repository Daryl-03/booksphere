
import 'package:booksphere/modules/component_modules/library_component/domain/entities/book.dart';
import 'package:booksphere/modules/component_modules/library_component/domain/entities/paginated_entity.dart';
import 'package:booksphere/modules/component_modules/library_component/domain/repository/library_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetBooksByGenreUseCase {
  final LibraryRepository _bookRepository;

  GetBooksByGenreUseCase(this._bookRepository);

  Future<PaginatedEntity<Book>> call(int genreId, int page, int size) async {
    return await _bookRepository.getBooksByGenre(genreId, page, size);
  }
}