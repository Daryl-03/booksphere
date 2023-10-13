import 'package:booksphere/modules/component_modules/library_component/domain/entities/book.dart';
import 'package:equatable/equatable.dart';

class ResultState extends Equatable {
  final bool isLoading;
  final int nextPage;
  final bool hasReachedMax;
  final bool isSearching;
  final List<Book> books;

  const ResultState._({
    required this.isLoading,
    required this.books,
    required this.nextPage,
    required this.hasReachedMax,
    required this.isSearching,
  });

  factory ResultState.initial() => const ResultState._(
        isLoading: false,
        books: [],
        nextPage: 0,
        hasReachedMax: false,
        isSearching: false,
  );

  ResultState copyWith({
    bool? isLoading,
    bool? isSearching,
    List<Book>? books,
    int? nextPage,
    bool? hasReachedMax,
  }) =>
      ResultState._(
        isLoading: isLoading ?? this.isLoading,
        books: books ?? this.books,
        nextPage: nextPage ?? this.nextPage,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
        isSearching: isSearching ?? this.isSearching,
      );

  @override
  List<Object?> get props => [isLoading, books, nextPage, hasReachedMax, isSearching];
}
