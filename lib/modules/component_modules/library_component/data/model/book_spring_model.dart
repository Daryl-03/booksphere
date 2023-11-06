import 'package:booksphere/modules/component_modules/library_component/data/model/genre_spring_model.dart';
import 'package:booksphere/modules/component_modules/library_component/domain/entities/book.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:logger/logger.dart';

import 'author_spring_model.dart';

part 'book_spring_model.g.dart';

@JsonSerializable()
class BookSpringModel extends Equatable{

  const BookSpringModel({
    required this.bookId,
    required this.title,
    required this.description,
    required this.coverImg,
    required this.isbn,
    required this.pages,
    required this.rating,
    required this.numRatings,
    required this.genres,
    required this.authors,
  });

  final String bookId;
  final String title;
  final String description;
  final String coverImg;
  final String isbn;
  final int pages;
  final double rating;
  final int numRatings;
  final List<GenreSpringModel>? genres;
  final List<AuthorSpringModel>? authors;


  @override
  List<Object?> get props => [
    bookId,
    title,
    description,
    coverImg,
    isbn,
    pages,
    rating,
    numRatings,
    genres,
    authors,
  ];

  Book toEntity() => Book(
    bookId: bookId,
    title: title,
    description: description,
    coverImg: coverImg,
    isbn: isbn,
    pages: pages,
    rating: rating,
    numRatings: numRatings,
    genres: genres?.map((e) => e.name).toList() ?? [],
    authors: authors?.map((e) => e.name).toList() ?? [],
  );

  factory BookSpringModel.fromEntity(Book book) => BookSpringModel(
    bookId: book.bookId,
    title: book.title,
    description: book.description,
    coverImg: book.coverImg,
    isbn: book.isbn,
    pages: book.pages,
    rating: book.rating,
    numRatings: book.numRatings,
    genres: book.genres.map((e) => GenreSpringModel(id: 0, name: e)).toList(),
    authors: book.authors.map((e) => AuthorSpringModel(id: 0, name: e)).toList(),
  );

  factory BookSpringModel.fromJson(Map<String, dynamic> json) {
    // Logger().i(json);
    return _$BookSpringModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BookSpringModelToJson(this);
}