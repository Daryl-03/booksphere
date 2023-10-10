
import 'package:booksphere/modules/component_modules/library_component/domain/entities/book.dart';
import 'package:booksphere/modules/component_modules/library_component/domain/entities/paginated_entity.dart';
import 'package:booksphere/modules/component_modules/library_component/domain/repository/library_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetBooksByAuthorUseCase {

  final LibraryRepository _libraryRepository;

  const GetBooksByAuthorUseCase(this._libraryRepository);

  Future<PaginatedEntity<Book>> call(String search, int page, [Object? cancelToken]) async{
    return await _libraryRepository.getBooksByAuthor(search, page, cancelToken);
  }
}