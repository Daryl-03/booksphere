
import 'package:booksphere/modules/component_modules/library_component/domain/entities/rating.dart';
import 'package:booksphere/modules/component_modules/library_component/domain/entities/user_history.dart';

abstract class BookDetailEvent {}

class InitBookDetailState extends BookDetailEvent {
  final String bookId;

  InitBookDetailState(this.bookId);
}

class AddToLibrary extends BookDetailEvent {
  final UserHistory userHistory;
  final Rating? rating;

  AddToLibrary(this.userHistory, this.rating);
}

class UpdateRating extends BookDetailEvent {
  final Rating rating;

  UpdateRating(this.rating);
}

class UpdateHistory extends BookDetailEvent {
  final UserHistory userHistory;
  final Rating? rating;

  UpdateHistory(this.userHistory, this.rating);
}

class RemoveFromLibrary extends BookDetailEvent {}