
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:booksphere/modules/component_modules/library_component/domain/entities/book_state.dart';
import 'package:booksphere/modules/component_modules/library_component/domain/use_cases/library_use_cases.dart';
import 'package:booksphere/modules/ui_modules/library_module/book_detail/book_detail_event.dart';
import 'package:booksphere/modules/ui_modules/library_module/book_detail/book_detail_state.dart';
import 'package:get_it/get_it.dart';

class BookDetailBloc extends Bloc<BookDetailEvent, BookDetailState>{

  BookDetailBloc() : super(BookDetailState.initial()){
    on<InitBookDetailState>(_onInitBookDetailState);
    on<UpdateHistory>(_onUpdateHistory);
    on<RemoveFromLibrary>(_onRemoveFromLibrary);
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

  FutureOr<void> _onUpdateHistory(UpdateHistory event, Emitter<BookDetailState> emit) async{

    if (state.isInHistory) {
      await _libraryUseCases.updateBookInHistoryUseCase(event.userHistory);
    } else {
      await _libraryUseCases.addBookToHistoryUseCase(event.userHistory);
    }

    if (event.userHistory.bookState == BookState.read) {
      if (state.rating != null) {
        await _libraryUseCases.updateRatingUseCase(event.rating!);
      } else {
        await _libraryUseCases.rateBookUseCase(
          event.rating!.copyWith(
            bookId: event.userHistory.bookId,
            userId: event.userHistory.userId,
          ),
        );
      }
    } else {
      if (event.rating != null && state.rating!.id != null) {
        await _libraryUseCases.deleteRatingUseCase(event.rating!);
      }
    }

    emit(state.copyWith(
      userHistory: event.userHistory,
      rating: event.rating,
      isInHistory: true,
    ));
  }

  FutureOr<void> _onRemoveFromLibrary(RemoveFromLibrary event, Emitter<BookDetailState> emit) {
    if (state.isInHistory) {
      _libraryUseCases.deleteBookFromHistoryUseCase(state.userHistory!);

      if (state.rating != null) {
        _libraryUseCases.deleteRatingUseCase(state.rating!);
      }
    }

    emit(state.copyWith(
      userHistory: null,
      rating: null,
      isInHistory: false,
    ));
  }
}