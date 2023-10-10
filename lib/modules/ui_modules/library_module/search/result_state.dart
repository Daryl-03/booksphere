import 'package:booksphere/modules/component_modules/library_component/domain/entities/book.dart';
import 'package:equatable/equatable.dart';

class ResultState extends Equatable {
  bool isLoading = false;
  int nextPage = 0;
  bool hasReachedMax = false;
  bool isSearching = false;
  List<Book> books = [];

  ResultState._();

  factory ResultState.initial() => ResultState._();

  ResultState copyWith({
    bool? isLoading,
    bool? isSearching,
    List<Book>? books,
    int? nextPage,
    bool? hasReachedMax,
  }) =>
      ResultState._()
        ..isLoading = isLoading ?? this.isLoading
        ..books = books ?? this.books
        ..nextPage = nextPage ?? this.nextPage
        ..isSearching = isSearching ?? this.isSearching
        ..hasReachedMax = hasReachedMax ?? this.hasReachedMax;

  @override
  List<Object?> get props => [isLoading, books, nextPage, hasReachedMax, isSearching];
}
