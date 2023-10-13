import 'package:equatable/equatable.dart';

class Rating extends Equatable{
  final int? id;
  final String userId;
  final String bookId;
  final double rating;

  const Rating({
    this.id,
    required this.userId,
    required this.bookId,
    required this.rating,
  });

  Rating copyWith({
    int? id,
    String? userId,
    String? bookId,
    double? rating,
  }) {
    return Rating(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      bookId: bookId ?? this.bookId,
      rating: rating ?? this.rating,
    );
  }

  @override
  List<Object?> get props => [
    id,
    userId,
    bookId,
    rating,
  ];
}