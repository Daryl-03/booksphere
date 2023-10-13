
import 'package:booksphere/modules/component_modules/library_component/domain/entities/book_state.dart';
import 'package:booksphere/modules/component_modules/library_component/domain/entities/user_history.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_history_spring_model.g.dart';

@JsonSerializable()
class UserHistorySpringModel extends Equatable {
  const UserHistorySpringModel({
    this.id,
    required this.userId,
    required this.bookId,
    required this.bookState,
    required this.bookmark
  });

  final int? id;
  final String userId;
  final String bookId;
  final BookState bookState;
  final int? bookmark;

  UserHistory toEntity() => UserHistory(
    id: id,
    userId: userId,
    bookId: bookId,
    bookState: bookState,
    bookmark: bookmark
  );

  factory UserHistorySpringModel.fromEntity(UserHistory userHistory) => UserHistorySpringModel(
    id: userHistory.id,
    userId: userHistory.userId,
    bookId: userHistory.bookId,
    bookState: userHistory.bookState,
    bookmark: userHistory.bookmark
  );

  @override
  List<Object?> get props {
    return [
      id,
      userId,
      bookId,
      bookState,
      bookmark
    ];
  }

  factory UserHistorySpringModel.fromJson(Map<String, dynamic> json) => _$UserHistorySpringModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserHistorySpringModelToJson(this);
}
