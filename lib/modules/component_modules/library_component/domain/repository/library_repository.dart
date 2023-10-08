
import 'package:booksphere/modules/component_modules/library_component/domain/entities/book.dart';
import 'package:booksphere/modules/component_modules/library_component/domain/entities/book_state.dart';
import 'package:booksphere/modules/component_modules/library_component/domain/entities/genre.dart';
import 'package:booksphere/modules/component_modules/library_component/domain/entities/rating.dart';

abstract class LibraryRepository {

  // method to get small list of books per genre for home screen
  Future<Map<Genre, List<Book>>> getSmallListOfBooksPerGenre();

  Future<List<Book>> getBooks(int page, int size);

  Future<List<Book>> getBooksByGenre(int genreId, int page, int size);

  Future<List<Book>> getBooksBySearch(String search, int page);

  Future<bool> rateBook(Rating rating);

  Future<bool> updateRating(Rating rating);

  Future<bool> deleteRating(Rating rating);

  Future<bool> addBookToHistory(String bookId, BookState bookState, int bookmark);

  Future<bool> updateBookInHistory(String bookId, BookState bookState, int bookmark);

  Future<bool> deleteBookFromHistory(String bookId);
}