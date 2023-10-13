
import 'package:booksphere/modules/component_modules/library_component/domain/entities/book.dart';
import 'package:booksphere/modules/component_modules/library_component/domain/repository/library_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetBooksByIdsUseCase {
  final LibraryRepository _libraryRepository;

  GetBooksByIdsUseCase(this._libraryRepository);

  Future<List<Book>> call(List<String> ids) async {
    return await _libraryRepository.getBooksByIds(ids);
  }
}