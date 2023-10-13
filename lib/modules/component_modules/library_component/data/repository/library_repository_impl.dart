import 'package:booksphere/modules/component_modules/library_component/data/datasource/spring_book_api_service.dart';
import 'package:booksphere/modules/component_modules/library_component/data/model/rating_spring_model.dart';
import 'package:booksphere/modules/component_modules/library_component/data/model/user_history_spring_model.dart';
import 'package:booksphere/modules/component_modules/library_component/domain/entities/book.dart';
import 'package:booksphere/modules/component_modules/library_component/domain/entities/paginated_entity.dart';
import 'package:booksphere/modules/component_modules/library_component/domain/entities/rating.dart';
import 'package:booksphere/modules/component_modules/library_component/domain/entities/user_history.dart';
import 'package:booksphere/modules/component_modules/library_component/domain/repository/library_repository.dart';
import 'package:booksphere/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@Injectable(as: LibraryRepository)
class  LibraryRepositoryImpl implements LibraryRepository {
  LibraryRepositoryImpl(this._springBookApiService);

  final SpringBookApiService _springBookApiService;
  final String _userId = FirebaseAuth.instance.currentUser!.uid;

  @override
  Future<bool> addBookToHistory(UserHistory userHistory) {
    return _springBookApiService.springBookApiClient
        .create(UserHistorySpringModel.fromEntity(userHistory))
        .then((value) => true);
  }

  @override
  Future<bool> deleteBookFromHistory(UserHistory userHistory) {
    return _springBookApiService.springBookApiClient
        .delete(UserHistorySpringModel.fromEntity(userHistory))
        .then((value) => true);
  }

  @override
  Future<bool> deleteRating(Rating rating) {
    return _springBookApiService.springBookApiClient
        .deleteRatingByUserIdAndBookId(rating.userId, rating.bookId)
        .then((value) => true);
  }

  @override
  Future<PaginatedEntity<Book>> getBooksByGenre(int genreId, int page, int size) {
    return _springBookApiService.springBookApiClient
        .getBooksPerGenre(genreId, page, size)
        .then((value) => PaginatedEntity(meta: value.meta, data: value.data.map((e) => e.toEntity()).toList()));
  }

  @override
  Future<PaginatedEntity<Book>> getBooksBySearch(String search, int page, [Object? cancelToken]) {
    return _springBookApiService.springBookApiClient
        .searchBooks(search, page, cancelToken as CancelToken?)
        .then((value) => PaginatedEntity(meta: value.meta, data: value.data.map((e) => e.toEntity()).toList()));
  }

  // @override
  // Future<Map<Genre, List<Book>>> getSmallListOfBooksPerGenre() async {
  //   Map<Genre, List<Book>> map = {};
  //   for (var genre in BookGenreUtils.getAppGenres()) {
  //     map[genre] = [];
  //     var books = await _springBookApiService.springBookApiClient
  //         .getBooksPerGenre(genre.id, 0, 10);
  //     for (var book in books) {
  //       map[genre]!.add(book.toEntity());
  //     }
  //   }
  //   return map;
  // }

  @override
  Future<bool> rateBook(Rating rating) {
    return _springBookApiService.springBookApiClient
        .createRating(RatingSpringModel.fromEntity(rating))
        .then((value) => true);
  }

  @override
  Future<bool> updateBookInHistory(UserHistory userHistory) {
    return _springBookApiService.springBookApiClient
        .create(UserHistorySpringModel.fromEntity(userHistory))
        .then((value) => true);
  }

  @override
  Future<bool> updateRating(Rating rating) {
    return _springBookApiService.springBookApiClient
        .updateRating(rating.userId, RatingSpringModel.fromEntity(rating))
        .then((value) => true);
  }

  @override
  Future<PaginatedEntity<Book>> getBooks(int page, int size) {
    return _springBookApiService.springBookApiClient
        .getBooks(page, size)
        .then((value) => PaginatedEntity(
            meta: value.meta, data: value.data.map((e) => e.toEntity()).toList()));
  }

  @override
  Future<PaginatedEntity<Book>> getBooksByAuthor(String search, int page, [Object? cancelToken]) {
    // return _springBookApiService.springBookApiClient
   throw UnimplementedError();
  }

  @override
  Future<PaginatedEntity<Book>> getBooksByTitle(String search, int page, [Object? cancelToken]) {
    try {
      return _springBookApiService.springBookApiClient
          .searchBooksByTitle(search, page, cancelToken as CancelToken)
          .then((value) => PaginatedEntity(
          meta: value.meta, data: value.data.map((e) => e.toEntity()).toList()));
    } on DioException catch (e) {
      Logger().e(e);
      return Future.value(PaginatedEntity.initial());
    }
  }

  @override
  Future<Rating?> getRatingByBookId(String bookId) {
    return _springBookApiService.springBookApiClient
        .getRatingByBookIdAndUserId(bookId, _userId)
        .then((value) => value?.toEntity());
  }

  @override
  Future<UserHistory?> getUserHistoryByBookId(String bookId) {
    return _springBookApiService.springBookApiClient
        .getUserHistoryByUserIdAndBookId(_userId, bookId)
        .then((value) => value?.toEntity());
  }

  @override
  Future<List<UserHistory>> getUserHistory() {
    return _springBookApiService.springBookApiClient
        .getUserHistoryByUserId(_userId)
        .then((value) => value.map((e) => e.toEntity()).toList());
  }

  @override
  Future<List<Rating>> getRatingsByUserId() {
    return _springBookApiService.springBookApiClient
        .getRatingsByUserId(_userId)
        .then((value) => value.map((e) => e.toEntity()).toList());
  }

  @override
  Future<List<Book>> getBooksByIds(List<String> ids) {
    // Logger().i('ids: $ids');
    return _springBookApiService.springBookApiClient
        .getBooksByIds(ids)
        .then((value) => value.map((e) => e.toEntity()).toList());
  }

  @override
  Future<List<Book>> getRecommendedBooks() {
    return _springBookApiService.springBookApiClient
        .getRecommendedBooks(_userId)
        .then((value) => value.map((e) => e.toEntity()).toList());
  }

}
