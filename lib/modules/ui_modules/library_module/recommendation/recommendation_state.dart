
import 'package:booksphere/modules/component_modules/library_component/domain/entities/book.dart';
import 'package:equatable/equatable.dart';

class RecommendationState extends Equatable{

  final List<Book> books;
  final bool isFetching;
  final String? error;

  const RecommendationState._({
    required this.books,
    required this.isFetching,
    this.error,
  });

  factory RecommendationState.initial() => const RecommendationState._(
    books: [],
    isFetching: false,
    error: null,
  );

  RecommendationState copyWith({
    List<Book>? books,
    bool? isFetching,
    String? error,
  }) {
    return RecommendationState._(
      books: books ?? this.books,
      isFetching: isFetching ?? this.isFetching,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [books, isFetching, error];

}