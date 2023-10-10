
import 'package:booksphere/modules/component_modules/library_component/domain/entities/rating.dart';
import 'package:booksphere/modules/component_modules/library_component/domain/repository/library_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UpdateRatingUseCase {
  final LibraryRepository _repository;

  UpdateRatingUseCase(this._repository);

  Future<void> execute(Rating rating) async {
    await _repository.updateRating(rating);
  }
}