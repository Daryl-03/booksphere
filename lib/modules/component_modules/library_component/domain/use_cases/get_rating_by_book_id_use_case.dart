
import 'package:booksphere/modules/component_modules/library_component/domain/entities/rating.dart';
import 'package:booksphere/modules/component_modules/library_component/domain/repository/library_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetRatingByBookIdUseCase {
  final LibraryRepository _libraryRepository;

  GetRatingByBookIdUseCase(this._libraryRepository);

  Future<Rating?> call(String bookId) async {
    return await _libraryRepository.getRatingByBookId(bookId);
  }
}