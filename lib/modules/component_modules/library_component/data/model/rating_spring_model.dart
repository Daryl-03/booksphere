import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rating_spring_model.g.dart';

@JsonSerializable()
class RatingSpringModel extends Equatable{
  final int? id;
  final String userId;
  final String bookId;
  final int rating;

  const RatingSpringModel({
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

  factory RatingSpringModel.fromJson(Map<String, dynamic> json) => _$RatingSpringModelFromJson(json);

  Map<String, dynamic> toJson() => _$RatingSpringModelToJson(this);
}