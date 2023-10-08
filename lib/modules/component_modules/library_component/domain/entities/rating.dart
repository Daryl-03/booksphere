import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class Rating extends Equatable{
  final int? id;
  final String userId;
  final String bookId;
  final int rating;

  const Rating({
    this.id,
    required this.userId,
    required this.bookId,
    required this.rating,
  });

  @override
  List<Object?> get props => [
    id,
    userId,
    bookId,
    rating,
  ];
}