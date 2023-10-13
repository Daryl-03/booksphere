import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:booksphere/modules/component_modules/library_component/domain/entities/book.dart';
import 'package:booksphere/modules/component_modules/library_component/domain/use_cases/library_use_cases.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

import 'result_event.dart';
import 'result_state.dart';

class ResultBloc extends Bloc<ResultEvent, ResultState> {
  ResultBloc() : super(ResultState.initial()) {
    on<ResultEventFetch>(_loadSearchResult);
  }

  final LibraryUseCases _libraryUseCases =
      GetIt.instance.get<LibraryUseCases>();
  CancelToken? _cancelToken;

  Future<void> _loadSearchResult(
      ResultEventFetch event, Emitter<ResultState> emit) async {

    if(event.query.isNotEmpty) {
      if(state.isLoading) {
        _cancelToken?.cancel();
      }
      emit(state.copyWith(isLoading: true, isSearching: true));
      Logger().i("fetching search result for query ${event.query}");
      List<Book> books = [];
      var booksPage =
          await _libraryUseCases.getBooksByTitleUseCase(event.query, state.nextPage, _cancelToken = CancelToken());
      Logger().i("search result fetched for query ${event.query}");
      books.addAll(booksPage.data);
      emit(
        state.copyWith(
          isLoading: false,
          books: books,
          nextPage: state.nextPage + 1,
          hasReachedMax: booksPage.meta.page == booksPage.meta.totalPages - 1,
        ),
      );
    } else{
      emit(state.copyWith(isLoading: false, books: [], nextPage: 0, hasReachedMax: false, isSearching: false));
    }
  }
}
