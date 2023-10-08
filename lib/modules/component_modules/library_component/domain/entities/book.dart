import 'package:equatable/equatable.dart';

class Book extends Equatable{

  const Book({
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
  final List<String> genres;
  final List<String> authors;


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

}