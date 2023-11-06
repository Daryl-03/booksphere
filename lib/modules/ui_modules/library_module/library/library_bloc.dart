
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:booksphere/modules/component_modules/library_component/domain/entities/book.dart';
import 'package:booksphere/modules/component_modules/library_component/domain/entities/book_state.dart';
import 'package:booksphere/modules/component_modules/library_component/domain/entities/filter_type.dart';
import 'package:booksphere/modules/component_modules/library_component/domain/use_cases/library_use_cases.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

import 'library_event.dart';
import 'library_state.dart';

class LibraryBloc extends Bloc<LibraryEvent, LibraryState>{

  LibraryBloc() : super(LibraryState.initial()){
    on<InitLibraryState>(_onInitLibraryState);
    on<FilterLibrary>(_onFilterLibrary);
  }

  final LibraryUseCases _libraryUseCases = GetIt.instance.get<LibraryUseCases>();

  FutureOr<void> _onInitLibraryState(InitLibraryState event, Emitter<LibraryState> emit) async{
    emit(state.copyWith(isFetching: true));

    var listUserHistories = await _libraryUseCases.getUserHistoryUseCase();
    var listBooks = [];
    if (listUserHistories.isNotEmpty) {
      var ids = listUserHistories.map((e) => e.bookId).toList();
      // Logger().i('ids: $ids');
      listBooks = await _libraryUseCases.getBooksByIdsUseCase(ids);
    }
    var ratings = await _libraryUseCases.getRatingsByUserIdUseCase();

    // Logger().i('listUserHistories: $listUserHistories');
    // Logger().i('listBooks: $listBooks');

    List<Book> listOfBooksInTheSameOrderWithUserHistory = [];
    if(listUserHistories.isNotEmpty){
      for (var element in listUserHistories) {
        listOfBooksInTheSameOrderWithUserHistory.add(listBooks.firstWhere((book) => book.bookId == element.bookId));
      }
    }

    emit(state.copyWith(
      userLibrary: listUserHistories,
      filteredUserLibrary: listUserHistories,
      books: listOfBooksInTheSameOrderWithUserHistory,
      filteredBooks: listOfBooksInTheSameOrderWithUserHistory,
      isFetching: false,
    ));
  }

  FutureOr<void> _onFilterLibrary(FilterLibrary event, Emitter<LibraryState> emit) {

    var filteredUserLibrary = state.userLibrary.where((element) {
      if (event.filterType == FilterType.all) {
        return true;
      } else {
        return element.bookState.name == event.filterType.name;
      }
    }).toList();

    var filteredBooks = filteredUserLibrary.map((userHistory) {
      return state.books.firstWhere((element) => element.bookId == userHistory.bookId);
    }).toList();

    emit(state.copyWith(
      filterType: event.filterType,
      filteredUserLibrary: filteredUserLibrary,
      filteredBooks: filteredBooks,
    ));
  }
}