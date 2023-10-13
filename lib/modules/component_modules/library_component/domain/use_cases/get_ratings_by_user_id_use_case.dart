
import 'package:booksphere/modules/component_modules/library_component/domain/entities/rating.dart';
import 'package:booksphere/modules/component_modules/library_component/domain/repository/library_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetRatingsByUserIdUseCase {
  final LibraryRepository _libraryRepository;

  GetRatingsByUserIdUseCase(this._libraryRepository);

  Future<List<Rating>> call() async{
    return await _libraryRepository.getRatingsByUserId();
  }
}