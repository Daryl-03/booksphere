
import 'package:booksphere/modules/component_modules/library_component/domain/entities/book.dart';
import 'package:equatable/equatable.dart';

class GenreState extends Equatable{

  List<Book> books = [];
  int nextPage = 0;
  bool hasReachedMax = false;

  static const int defaultPageSize = 15;

  GenreState._();

  factory GenreState.initial() => GenreState._()
    ..books = []
    ..nextPage = 0
    ..hasReachedMax = false;

  GenreState copyWith({
    List<Book>? books,
    int? nextPage,
    bool? hasReachedMax,
  }) {
    return GenreState._()
      ..books = books ?? this.books
      ..nextPage = nextPage ?? this.nextPage
      ..hasReachedMax = hasReachedMax ?? this.hasReachedMax;
  }

  @override
  List<Object?> get props => [books, nextPage, hasReachedMax];

}