import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:booksphere/modules/component_modules/library_component/domain/entities/book.dart';
import 'package:booksphere/modules/component_modules/library_component/domain/use_cases/library_use_cases.dart';
import 'package:get_it/get_it.dart';

import 'result_event.dart';
import 'result_state.dart';

class ResultBloc extends Bloc<ResultEvent, ResultState> {
  ResultBloc() : super(ResultState.initial()) {
    on<ResultEventFetch>(_loadSearchResult);
  }

  final LibraryUseCases _libraryUseCases =
      GetIt.instance.get<LibraryUseCases>();

  FutureOr<void> _loadSearchResult(
      ResultEventFetch event, Emitter<ResultState> emit) async {
    emit(state.copyWith(isLoading: true));

    List<Book> books = [];
    books =
        await _libraryUseCases.searchBookUseCase(event.query, state.nextPage);
    emit(
      state.copyWith(
        isLoading: false,
        books: books,
        nextPage: state.nextPage + 1,
        hasReachedMax: books.isEmpty,
      ),
    );
  }
}
