
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:booksphere/modules/component_modules/library_component/domain/entities/book.dart';
import 'package:booksphere/modules/component_modules/library_component/domain/entities/genre.dart';
import 'package:booksphere/modules/component_modules/library_component/domain/use_cases/library_use_cases.dart';
import 'package:booksphere/modules/component_modules/user_detail_component/domain/use_cases/user_detail_use_cases.dart';
import 'package:booksphere/utils/book_genre_utils.dart';
import 'package:booksphere/utils/constants.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState.initial()){
    on<HomeInitialEvent>(_onLoadInitialHomeEvent);
    on<HomeLogOutEvent>(_onLogoutHomeEvent);
  }

  static const int booksPerGenre = 10;
  final LibraryUseCases _libraryUseCases = GetIt.instance.get<LibraryUseCases>();
  final UserDetailUseCases _userDetailUseCases = GetIt.instance.get<UserDetailUseCases>();

  Future<void> _onLoadInitialHomeEvent(HomeInitialEvent event, Emitter<HomeState> emit) async{
    await _userDetailUseCases.getUserDataUseCase();
    emit(state.copyWith(isLoading: false, user: signedInUser));
    // Logger().d("user data fetched : $signedInUser");
    // Logger().d("fetching top books");


    var top = await _libraryUseCases.getBooksUseCase(3, booksPerGenre);
    // Logger().d("top books fetched : $top");
    emit(state.copyWith(topBooks: top.data));
    // Logger().d("fetching top books done");

    for (Genre genre in BookGenreUtils.getAppGenres()){
      var booksPage = await _libraryUseCases.getBooksByGenreUseCase(genre.id, 0, booksPerGenre);
      var map = Map<Genre, List<Book>>.from(state.map!);
      map[genre] = booksPage.data;
      emit(state.copyWith(map: map));
      // Logger().d("fetched books for genre ${genre.name}");
    }
  }

  Future<void> _onLogoutHomeEvent(HomeLogOutEvent event, Emitter<HomeState> emit) async{
    await _userDetailUseCases.signOutUseCase();
  }
}
