
import 'package:booksphere/modules/component_modules/library_component/domain/entities/book_state.dart';
import 'package:equatable/equatable.dart';


class UserHistory extends Equatable {
  const UserHistory({
    this.id,
    required this.userId,
    required this.bookId,
    required this.bookState,
    required this.bookmark
  });

  final int? id;
  final int userId;
  final String bookId;
  final BookState bookState;
  final int bookmark;

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
}
