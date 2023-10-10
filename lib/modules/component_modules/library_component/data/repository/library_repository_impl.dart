import 'package:booksphere/modules/component_modules/common/utils/pagination_info.dart';
import 'package:booksphere/modules/component_modules/library_component/data/datasource/spring_book_api_service.dart';
import 'package:booksphere/modules/component_modules/library_component/domain/entities/book.dart';
import 'package:booksphere/modules/component_modules/library_component/domain/entities/book_state.dart';
import 'package:booksphere/modules/component_modules/library_component/domain/entities/genre.dart';
import 'package:booksphere/modules/component_modules/library_component/domain/entities/paginated_entity.dart';
import 'package:booksphere/modules/component_modules/library_component/domain/entities/rating.dart';
import 'package:booksphere/modules/component_modules/library_component/domain/entities/user_history.dart';
import 'package:booksphere/modules/component_modules/library_component/domain/repository/library_repository.dart';
import 'package:booksphere/utils/book_genre_utils.dart';
import 'package:booksphere/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@Injectable(as: LibraryRepository)
class LibraryRepositoryImpl implements LibraryRepository {
  LibraryRepositoryImpl(this._springBookApiService);

  final SpringBookApiService _springBookApiService;

  @override
  Future<bool> addBookToHistory(UserHistory userHistory) {
    // TODO: implement addBookToHistory
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteBookFromHistory(String bookId) {
    // TODO: implement deleteBookFromHistory
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteRating(Rating rating) {
    // TODO: implement deleteRating
    throw UnimplementedError();
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
    // TODO: implement rateBook
    throw UnimplementedError();
  }

  @override
  Future<bool> updateBookInHistory(UserHistory userHistory) {
    // TODO: implement updateBookInHistory
    throw UnimplementedError();
  }

  @override
  Future<bool> updateRating(Rating rating) {
    // TODO: implement updateRating
    throw UnimplementedError();
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
        .getRatingByBookIdAndUserId(bookId, signedInUser!.id!)
        .then((value) => value?.toEntity());
  }

  @override
  Future<UserHistory?> getUserHistoryByBookId(String bookId) {
    return _springBookApiService.springBookApiClient
        .getUserHistoryByUserIdAndBookId(signedInUser!.id!, bookId)
        .then((value) => value?.toEntity());
  }
}
