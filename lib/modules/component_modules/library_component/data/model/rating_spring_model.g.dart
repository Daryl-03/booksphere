// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_spring_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RatingSpringModel _$RatingSpringModelFromJson(Map<String, dynamic> json) =>
    RatingSpringModel(
      id: json['id'] as int?,
      userId: json['userId'] as String,
      bookId: json['bookId'] as String,
      rating: (json['rating'] as num).toDouble(),
    );

Map<String, dynamic> _$RatingSpringModelToJson(RatingSpringModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'bookId': instance.bookId,
      'rating': instance.rating,
    };
