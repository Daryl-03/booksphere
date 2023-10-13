import 'package:booksphere/modules/component_modules/library_component/domain/entities/book_state.dart';
import 'package:equatable/equatable.dart';

class UserHistory extends Equatable {
  const UserHistory(
      {this.id,
      required this.userId,
      required this.bookId,
      required this.bookState,
      required this.bookmark});

  final int? id;
  final String userId;
  final String bookId;
  final BookState bookState;
  final int? bookmark;

  UserHistory copyWith({
    int? id,
    String? userId,
    String? bookId,
    BookState? bookState,
    int? bookmark,
  }) {
    return UserHistory(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      bookId: bookId ?? this.bookId,
      bookState: bookState ?? this.bookState,
      bookmark: bookmark ?? this.bookmark,
    );
  }

  @override
  List<Object?> get props {
    return [id, userId, bookId, bookState, bookmark];
  }
}
