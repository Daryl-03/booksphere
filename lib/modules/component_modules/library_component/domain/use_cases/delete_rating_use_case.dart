
import 'package:booksphere/modules/component_modules/library_component/domain/entities/rating.dart';
import 'package:booksphere/modules/component_modules/library_component/domain/repository/library_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DeleteRatingUseCase {
  final LibraryRepository _libraryRepository;

  DeleteRatingUseCase(this._libraryRepository);

  Future<void> call(Rating rating) async {
    await _libraryRepository.deleteRating(rating);
  }
}