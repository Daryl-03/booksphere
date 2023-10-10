import 'package:injectable/injectable.dart';

import 'get_books_by_author_use_case.dart';
import 'get_books_by_genre_use_case.dart';
import 'get_books_by_title_use_case.dart';
import 'get_books_use_case.dart';
import 'search_book_use_case.dart';
import 'add_book_to_history_use_case.dart';
import 'delete_book_from_history_use_case.dart';
import 'get_user_history_by_book_id_use_case.dart';
import 'update_book_in_history_use_case.dart';
import 'get_rating_by_book_id_use_case.dart';
import 'rate_book_use_case.dart';
import 'update_rating_use_case.dart';
import 'delete_rating_use_case.dart';

@injectable
class LibraryUseCases {
  final GetBooksByGenreUseCase getBooksByGenreUseCase;
  final GetBooksUseCase getBooksUseCase;
  final SearchBookUseCase searchBookUseCase;
  final GetBooksByTitleUseCase getBooksByTitleUseCase;
  final GetBooksByAuthorUseCase getBooksByAuthorUseCase;
  final AddBookToHistoryUseCase addBookToHistoryUseCase;
  final DeleteBookFromHistoryUseCase deleteBookFromHistoryUseCase;
  final GetUserHistoryByBookIdUseCase getUserHistoryByBookIdUseCase;
  final UpdateBookInHistoryUseCase updateBookInHistoryUseCase;
  final GetRatingByBookIdUseCase getRatingByBookIdUseCase;
  final RateBookUseCase rateBookUseCase;
  final UpdateRatingUseCase updateRatingUseCase;
  final DeleteRatingUseCase deleteRatingUseCase;


  LibraryUseCases({
    required this.getBooksByGenreUseCase,
    required this.getBooksUseCase,
    required this.searchBookUseCase,
    required this.getBooksByAuthorUseCase,
    required this.getBooksByTitleUseCase,
    required this.addBookToHistoryUseCase,
    required this.deleteBookFromHistoryUseCase,
    required this.getUserHistoryByBookIdUseCase,
    required this.updateBookInHistoryUseCase,
    required this.getRatingByBookIdUseCase,
    required this.rateBookUseCase,
    required this.updateRatingUseCase,
    required this.deleteRatingUseCase,
  });
}
