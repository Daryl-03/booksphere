// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_spring_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookSpringModel _$BookSpringModelFromJson(Map<String, dynamic> json) =>
    BookSpringModel(
      bookId: json['bookId'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      coverImg: json['coverImg'] as String,
      isbn: json['isbn'] as String,
      pages: json['pages'] as int,
      rating: (json['rating'] as num).toDouble(),
      numRatings: json['numRatings'] as int,
      genres:
          (json['genres'] as List<dynamic>?)?.map((e) => e as String).toList(),
      authors:
          (json['authors'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$BookSpringModelToJson(BookSpringModel instance) =>
    <String, dynamic>{
      'bookId': instance.bookId,
      'title': instance.title,
      'description': instance.description,
      'coverImg': instance.coverImg,
      'isbn': instance.isbn,
      'pages': instance.pages,
      'rating': instance.rating,
      'numRatings': instance.numRatings,
      'genres': instance.genres,
      'authors': instance.authors,
    };
