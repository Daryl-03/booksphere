import 'package:injectable/injectable.dart';

import 'get_books_by_genre_use_case.dart';
import 'get_books_use_case.dart';
import 'search_book_use_case.dart';

@injectable
class LibraryUseCases {
  final GetBooksByGenreUseCase getBooksByGenreUseCase;
  final GetBooksUseCase getBooksUseCase;
  final SearchBookUseCase searchBookUseCase;

  LibraryUseCases({
    required this.getBooksByGenreUseCase,
    required this.getBooksUseCase,
    required this.searchBookUseCase,
  });
}
