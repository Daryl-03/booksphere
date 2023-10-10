
import 'dart:async';

import 'package:booksphere/modules/component_modules/library_component/domain/entities/book.dart';
import 'package:booksphere/modules/component_modules/library_component/domain/repository/library_repository.dart';
import 'package:booksphere/modules/ui_modules/library_module/genres/genre_event.dart';
import 'package:booksphere/modules/ui_modules/library_module/genres/genre_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class GenreBloc extends Bloc<GenreEvent, GenreState> {
  GenreBloc() : super(GenreState.initial()){
    on<GenreEventFetch>(_onFetch);
  }

  final LibraryRepository _libraryRepository = GetIt.instance.get<LibraryRepository>();

  FutureOr<void> _onFetch(GenreEventFetch event, Emitter<GenreState> emit) async{
    List<Book> books = [];
    var bookPage = await _libraryRepository.getBooksByGenre(event.genre.id, event.page, GenreState.defaultPageSize);

    books.addAll(bookPage.data);

    emit(state.copyWith(
      books: books,
      nextPage: bookPage.meta.page + 1,
      hasReachedMax: bookPage.meta.page == bookPage.meta.totalPages - 1,
    ));
  }
}