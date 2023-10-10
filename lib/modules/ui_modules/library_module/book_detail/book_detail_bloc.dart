
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:booksphere/modules/component_modules/library_component/domain/use_cases/library_use_cases.dart';
import 'package:booksphere/modules/ui_modules/library_module/book_detail/book_detail_event.dart';
import 'package:booksphere/modules/ui_modules/library_module/book_detail/book_detail_state.dart';
import 'package:get_it/get_it.dart';

class BookDetailBloc extends Bloc<BookDetailEvent, BookDetailState>{

  BookDetailBloc() : super(BookDetailState.initial()){
    on<InitBookDetailState>(_onInitBookDetailState);
  }

  final LibraryUseCases _libraryUseCases = GetIt.instance.get<LibraryUseCases>();

  FutureOr<void> _onInitBookDetailState(InitBookDetailState event, Emitter<BookDetailState> emit) async{
    emit(state.copyWith(isFetching: true));

    var userHistory = await _libraryUseCases.getUserHistoryByBookIdUseCase(event.bookId);
    var rating = await _libraryUseCases.getRatingByBookIdUseCase(event.bookId);

    emit(state.copyWith(
      isFetching: false,
      userHistory: userHistory,
      rating: rating,
      isInHistory: userHistory != null,
    ));
  }
}