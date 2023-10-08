import 'package:booksphere/modules/component_modules/library_component/data/datasource/spring_book_api_service.dart';
import 'package:booksphere/modules/component_modules/library_component/domain/entities/book.dart';
import 'package:booksphere/modules/component_modules/library_component/domain/entities/book_state.dart';
import 'package:booksphere/modules/component_modules/library_component/domain/entities/genre.dart';
import 'package:booksphere/modules/component_modules/library_component/domain/entities/rating.dart';
import 'package:booksphere/modules/component_modules/library_component/domain/repository/library_repository.dart';
import 'package:booksphere/utils/book_genre_utils.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: LibraryRepository)
class LibraryRepositoryImpl implements LibraryRepository {
  LibraryRepositoryImpl(this._springBookApiService);

  final SpringBookApiService _springBookApiService;

  @override
  Future<bool> addBookToHistory(
      String bookId, BookState bookState, int bookmark) {
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
  Future<List<Book>> getBooksByGenre(int genreId, int page, int size) {
    return _springBookApiService.springBookApiClient
        .getBooksPerGenre(genreId, page, size)
        .then((value) => value.map((e) => e.toEntity()).toList());
  }

  @override
  Future<List<Book>> getBooksBySearch(String search, int page) {
    // TODO: implement getBooksBySearch
    throw UnimplementedError();
  }

  @override
  Future<Map<Genre, List<Book>>> getSmallListOfBooksPerGenre() async {
    Map<Genre, List<Book>> map = {};
    for (var genre in BookGenreUtils.getAppGenres()) {
      map[genre] = [];
      var books = await _springBookApiService.springBookApiClient
          .getBooksPerGenre(genre.id, 0, 10);
      for (var book in books) {
        map[genre]!.add(book.toEntity());
      }
    }
    return map;
  }

  @override
  Future<bool> rateBook(Rating rating) {
    // TODO: implement rateBook
    throw UnimplementedError();
  }

  @override
  Future<bool> updateBookInHistory(
      String bookId, BookState bookState, int bookmark) {
    // TODO: implement updateBookInHistory
    throw UnimplementedError();
  }

  @override
  Future<bool> updateRating(Rating rating) {
    // TODO: implement updateRating
    throw UnimplementedError();
  }

  @override
  Future<List<Book>> getBooks(int page, int size) {
    return _springBookApiService.springBookApiClient
        .getBooks(page, size)
        .then((value) => value.map((e) => e.toEntity()).toList());
  }
}
