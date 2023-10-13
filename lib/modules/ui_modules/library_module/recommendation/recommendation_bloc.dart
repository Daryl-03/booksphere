
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:booksphere/modules/component_modules/library_component/domain/use_cases/library_use_cases.dart';
import 'package:get_it/get_it.dart';

import 'recommendation_event.dart';
import 'recommendation_state.dart';

class RecommendationBloc extends Bloc<RecommendationEvent, RecommendationState>{
  RecommendationBloc() : super(RecommendationState.initial()){
    on<GetRecommendedBooksEvent>(_onGetRecommendedBooksEvent);
  }

  final _libraryUseCases = GetIt.instance.get<LibraryUseCases>();

  FutureOr<void> _onGetRecommendedBooksEvent(GetRecommendedBooksEvent event, Emitter<RecommendationState> emit) async{
    emit(state.copyWith(isFetching: true));

    try {
      var books = await _libraryUseCases.getRecommendedBooksUseCase();

      emit(state.copyWith(
        isFetching: false,
        books: books,
      ));
    } on Exception catch (e) {
      emit(state.copyWith(
        isFetching: false,
        error: e.toString(),
        books: [],
      ));
    }
  }
}