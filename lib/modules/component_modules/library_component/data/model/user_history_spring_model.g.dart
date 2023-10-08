// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_history_spring_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserHistorySpringModel _$UserHistorySpringModelFromJson(
        Map<String, dynamic> json) =>
    UserHistorySpringModel(
      id: json['id'] as int?,
      userId: json['userId'] as int,
      bookId: json['bookId'] as String,
      bookState: $enumDecode(_$BookStateEnumMap, json['bookState']),
      bookmark: json['bookmark'] as int,
    );

Map<String, dynamic> _$UserHistorySpringModelToJson(
        UserHistorySpringModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'bookId': instance.bookId,
      'bookState': _$BookStateEnumMap[instance.bookState]!,
      'bookmark': instance.bookmark,
    };

const _$BookStateEnumMap = {
  BookState.read: 'READ',
  BookState.reading: 'READING',
  BookState.wantToRead: 'WANT_TO_READ',
};
