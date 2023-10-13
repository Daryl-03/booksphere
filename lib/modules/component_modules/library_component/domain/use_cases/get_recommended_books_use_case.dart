
import 'package:booksphere/modules/component_modules/library_component/domain/entities/book.dart';
import 'package:booksphere/modules/component_modules/library_component/domain/repository/library_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetRecommendedBooksUseCase {
  final LibraryRepository _libraryRepository;

  GetRecommendedBooksUseCase(this._libraryRepository);

  Future<List<Book>> call() async {
    return await _libraryRepository.getRecommendedBooks();
  }
}