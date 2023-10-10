
import 'package:booksphere/modules/component_modules/library_component/domain/entities/rating.dart';
import 'package:booksphere/modules/component_modules/library_component/domain/entities/user_history.dart';
import 'package:equatable/equatable.dart';

class BookDetailState extends Equatable {
  UserHistory? userHistory;
  Rating? rating;
  bool isInHistory = false;
  bool isFetching = false;

  BookDetailState._();

  factory BookDetailState.initial() => BookDetailState._();

  BookDetailState copyWith({
    UserHistory? userHistory,
    Rating? rating,
    bool? isInHistory,
    bool? isFetching,
  }) {
    return BookDetailState._()
      ..userHistory = userHistory ?? this.userHistory
      ..rating = rating ?? this.rating
      ..isInHistory = isInHistory ?? this.isInHistory
      ..isFetching = isFetching ?? this.isFetching;
  }

  @override
  List<Object?> get props => [
    userHistory,
    rating,
    isInHistory,
    isFetching,
  ];
}