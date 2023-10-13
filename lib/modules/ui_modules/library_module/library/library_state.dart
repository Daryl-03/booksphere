
import 'package:booksphere/modules/component_modules/library_component/domain/entities/book.dart';
import 'package:booksphere/modules/component_modules/library_component/domain/entities/filter_type.dart';
import 'package:booksphere/modules/component_modules/library_component/domain/entities/user_history.dart';
import 'package:equatable/equatable.dart';

class LibraryState extends Equatable{
  List<UserHistory> userLibrary = [];
  List<UserHistory> filteredUserLibrary = [];
  List<Book> books = [];
  List<Book> filteredBooks = [];
  bool isFetching = false;
  FilterType filterType = FilterType.all;

  LibraryState._();

  factory LibraryState.initial() => LibraryState._();

  LibraryState copyWith({
    List<UserHistory>? userLibrary,
    List<UserHistory>? filteredUserLibrary,
    List<Book>? books,
    List<Book>? filteredBooks,
    bool? isFetching,
    FilterType? filterType,
  }) {
    return LibraryState._()
      ..userLibrary = userLibrary ?? this.userLibrary
      ..filteredUserLibrary = filteredUserLibrary ?? this.filteredUserLibrary
      ..books = books ?? this.books
      ..filteredBooks = filteredBooks ?? this.filteredBooks
      ..isFetching = isFetching ?? this.isFetching
      ..filterType = filterType ?? this.filterType;
  }

  @override
  List<Object?> get props => [
    userLibrary,
    filteredUserLibrary,
    books,
    filteredBooks,
    isFetching,
    filterType,
  ];
}