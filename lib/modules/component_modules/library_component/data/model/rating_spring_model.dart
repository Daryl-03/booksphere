import 'package:booksphere/modules/component_modules/library_component/domain/entities/rating.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rating_spring_model.g.dart';

@JsonSerializable()
class RatingSpringModel extends Equatable{
  final int? id;
  final String userId;
  final String bookId;
  final double rating;

  const RatingSpringModel({
    this.id,
    required this.userId,
    required this.bookId,
    required this.rating,
  });

  Rating toEntity() => Rating(
    id: id,
    userId: userId,
    bookId: bookId,
    rating: rating,
  );

  factory RatingSpringModel.fromEntity(Rating entity) => RatingSpringModel(
    id: entity.id,
    userId: entity.userId,
    bookId: entity.bookId,
    rating: entity.rating,
  );

  @override
  List<Object?> get props => [
    id,
    userId,
    bookId,
    rating,
  ];

  factory RatingSpringModel.fromJson(Map<String, dynamic> json) => _$RatingSpringModelFromJson(json);

  Map<String, dynamic> toJson() => _$RatingSpringModelToJson(this);
}