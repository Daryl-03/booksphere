
import 'package:booksphere/modules/component_modules/library_component/domain/entities/book.dart';
import 'package:booksphere/modules/component_modules/library_component/domain/entities/paginated_entity.dart';
import 'package:booksphere/modules/component_modules/library_component/domain/entities/rating.dart';
import 'package:booksphere/modules/component_modules/library_component/domain/entities/user_history.dart';

abstract class LibraryRepository {

  // method to get small list of books per genre for home screen
  // Future<Map<Genre, List<Book>>> getSmallListOfBooksPerGenre();
  // book methods
  Future<PaginatedEntity<Book>> getBooks(int page, int size);

  Future<PaginatedEntity<Book>> getBooksByGenre(int genreId, int page, int size);

  Future<PaginatedEntity<Book>> getBooksBySearch(String search, int page, [Object? cancelToken]);

  Future<PaginatedEntity<Book>> getBooksByTitle(String search, int page, [Object? cancelToken]);

  Future<PaginatedEntity<Book>> getBooksByAuthor(String search, int page, [Object? cancelToken]);

  Future<List<Book>> getBooksByIds(List<String> ids);

  // rating methods

  Future<bool> rateBook(Rating rating);

  Future<bool> updateRating(Rating rating);

  Future<bool> deleteRating(Rating rating);

  Future<Rating?> getRatingByBookId(String bookId);

  Future<List<Rating>> getRatingsByUserId();

  // user history methods

  Future<bool> addBookToHistory(UserHistory userHistory);

  Future<bool> updateBookInHistory(UserHistory userHistory);

  Future<bool> deleteBookFromHistory(UserHistory userHistory);

  Future<UserHistory?> getUserHistoryByBookId(String bookId);

  Future<List<UserHistory>> getUserHistory();

  // recommended books methods

  Future<List<Book>> getRecommendedBooks();
}