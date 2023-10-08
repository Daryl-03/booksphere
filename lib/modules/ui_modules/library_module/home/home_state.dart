
import 'package:booksphere/modules/component_modules/library_component/domain/entities/book.dart';
import 'package:booksphere/modules/component_modules/library_component/domain/entities/genre.dart';
import 'package:booksphere/modules/component_modules/user_detail_component/domain/entities/booksphere_user.dart';
import 'package:equatable/equatable.dart';

class HomeState extends Equatable{

  Map<Genre, List<Book>>? map;
  List<Book>? topBooks;
  bool isLoading = true;
  BooksphereUser? user;

  HomeState._();

  factory HomeState.initial() => HomeState._()
    ..map = {}
    ..topBooks = []
    ..isLoading = true
    ..user = null;

  HomeState copyWith({
    Map<Genre, List<Book>>? map,
    List<Book>? topBooks,
    bool? isLoading,
    BooksphereUser? user
  }) => HomeState._()
    ..map = map ?? this.map
    ..topBooks = topBooks ?? this.topBooks
    ..isLoading = isLoading ?? this.isLoading
    ..user = user ?? this.user;

  @override
  List<Object?> get props => [
    map,
    topBooks,
    isLoading,
    user
  ];
}