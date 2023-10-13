// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:booksphere/modules/component_modules/library_component/data/datasource/spring_book_api_service.dart'
    as _i3;
import 'package:booksphere/modules/component_modules/library_component/data/repository/library_repository_impl.dart'
    as _i10;
import 'package:booksphere/modules/component_modules/library_component/domain/repository/library_repository.dart'
    as _i9;
import 'package:booksphere/modules/component_modules/library_component/domain/use_cases/add_book_to_history_use_case.dart'
    as _i20;
import 'package:booksphere/modules/component_modules/library_component/domain/use_cases/delete_book_from_history_use_case.dart'
    as _i21;
import 'package:booksphere/modules/component_modules/library_component/domain/use_cases/delete_rating_use_case.dart'
    as _i22;
import 'package:booksphere/modules/component_modules/library_component/domain/use_cases/get_books_by_author_use_case.dart'
    as _i23;
import 'package:booksphere/modules/component_modules/library_component/domain/use_cases/get_books_by_genre_use_case.dart'
    as _i24;
import 'package:booksphere/modules/component_modules/library_component/domain/use_cases/get_books_by_ids_use_case.dart'
    as _i25;
import 'package:booksphere/modules/component_modules/library_component/domain/use_cases/get_books_by_title_use_case.dart'
    as _i26;
import 'package:booksphere/modules/component_modules/library_component/domain/use_cases/get_books_use_case.dart'
    as _i27;
import 'package:booksphere/modules/component_modules/library_component/domain/use_cases/get_rating_by_book_id_use_case.dart'
    as _i28;
import 'package:booksphere/modules/component_modules/library_component/domain/use_cases/get_ratings_by_user_id_use_case.dart'
    as _i29;
import 'package:booksphere/modules/component_modules/library_component/domain/use_cases/get_recommended_books_use_case.dart'
    as _i30;
import 'package:booksphere/modules/component_modules/library_component/domain/use_cases/get_user_history_by_book_id_use_case.dart'
    as _i31;
import 'package:booksphere/modules/component_modules/library_component/domain/use_cases/get_user_history_use_case.dart'
    as _i32;
import 'package:booksphere/modules/component_modules/library_component/domain/use_cases/library_use_cases.dart'
    as _i33;
import 'package:booksphere/modules/component_modules/library_component/domain/use_cases/rate_book_use_case.dart'
    as _i11;
import 'package:booksphere/modules/component_modules/library_component/domain/use_cases/search_book_use_case.dart'
    as _i12;
import 'package:booksphere/modules/component_modules/library_component/domain/use_cases/update_book_in_history_use_case.dart'
    as _i16;
import 'package:booksphere/modules/component_modules/library_component/domain/use_cases/update_rating_use_case.dart'
    as _i17;
import 'package:booksphere/modules/component_modules/user_detail_component/data/repository/auth_repository_impl.dart'
    as _i7;
import 'package:booksphere/modules/component_modules/user_detail_component/data/repository/user_data_repository_impl.dart'
    as _i5;
import 'package:booksphere/modules/component_modules/user_detail_component/domain/repository/auth_repository.dart'
    as _i6;
import 'package:booksphere/modules/component_modules/user_detail_component/domain/repository/user_data_repository.dart'
    as _i4;
import 'package:booksphere/modules/component_modules/user_detail_component/domain/use_cases/get_user_data_use_case.dart'
    as _i8;
import 'package:booksphere/modules/component_modules/user_detail_component/domain/use_cases/sign_in_with_email_use_case.dart'
    as _i13;
import 'package:booksphere/modules/component_modules/user_detail_component/domain/use_cases/sign_out_use_case.dart'
    as _i14;
import 'package:booksphere/modules/component_modules/user_detail_component/domain/use_cases/sign_up_with_email_use_case.dart'
    as _i15;
import 'package:booksphere/modules/component_modules/user_detail_component/domain/use_cases/update_user_data_use_case.dart'
    as _i18;
import 'package:booksphere/modules/component_modules/user_detail_component/domain/use_cases/user_detail_use_cases.dart'
    as _i19;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.SpringBookApiService>(() => _i3.SpringBookApiService());
    gh.factory<_i4.UserDataRepository>(() => _i5.UserDataRepositoryImpl());
    gh.factory<_i6.AuthRepository>(
        () => _i7.AuthRepositoryImpl(gh<_i4.UserDataRepository>()));
    gh.lazySingleton<_i8.GetUserDataUseCase>(
        () => _i8.GetUserDataUseCase(gh<_i4.UserDataRepository>()));
    gh.factory<_i9.LibraryRepository>(
        () => _i10.LibraryRepositoryImpl(gh<_i3.SpringBookApiService>()));
    gh.lazySingleton<_i11.RateBookUseCase>(
        () => _i11.RateBookUseCase(gh<_i9.LibraryRepository>()));
    gh.lazySingleton<_i12.SearchBookUseCase>(
        () => _i12.SearchBookUseCase(gh<_i9.LibraryRepository>()));
    gh.lazySingleton<_i13.SignInWithEmailUseCase>(
        () => _i13.SignInWithEmailUseCase(gh<_i6.AuthRepository>()));
    gh.lazySingleton<_i14.SignOutUseCase>(
        () => _i14.SignOutUseCase(gh<_i6.AuthRepository>()));
    gh.lazySingleton<_i15.SignUpWithEmailUseCase>(
        () => _i15.SignUpWithEmailUseCase(gh<_i6.AuthRepository>()));
    gh.lazySingleton<_i16.UpdateBookInHistoryUseCase>(
        () => _i16.UpdateBookInHistoryUseCase(gh<_i9.LibraryRepository>()));
    gh.lazySingleton<_i17.UpdateRatingUseCase>(
        () => _i17.UpdateRatingUseCase(gh<_i9.LibraryRepository>()));
    gh.lazySingleton<_i18.UpdateUserDataUseCase>(
        () => _i18.UpdateUserDataUseCase(gh<_i4.UserDataRepository>()));
    gh.factory<_i19.UserDetailUseCases>(() => _i19.UserDetailUseCases(
          signInWithEmailUseCase: gh<_i13.SignInWithEmailUseCase>(),
          signUpWithEmailUseCase: gh<_i15.SignUpWithEmailUseCase>(),
          signOutUseCase: gh<_i14.SignOutUseCase>(),
          updateUserDataUseCase: gh<_i18.UpdateUserDataUseCase>(),
          getUserDataUseCase: gh<_i8.GetUserDataUseCase>(),
        ));
    gh.lazySingleton<_i20.AddBookToHistoryUseCase>(
        () => _i20.AddBookToHistoryUseCase(gh<_i9.LibraryRepository>()));
    gh.lazySingleton<_i21.DeleteBookFromHistoryUseCase>(
        () => _i21.DeleteBookFromHistoryUseCase(gh<_i9.LibraryRepository>()));
    gh.lazySingleton<_i22.DeleteRatingUseCase>(
        () => _i22.DeleteRatingUseCase(gh<_i9.LibraryRepository>()));
    gh.lazySingleton<_i23.GetBooksByAuthorUseCase>(
        () => _i23.GetBooksByAuthorUseCase(gh<_i9.LibraryRepository>()));
    gh.lazySingleton<_i24.GetBooksByGenreUseCase>(
        () => _i24.GetBooksByGenreUseCase(gh<_i9.LibraryRepository>()));
    gh.lazySingleton<_i25.GetBooksByIdsUseCase>(
        () => _i25.GetBooksByIdsUseCase(gh<_i9.LibraryRepository>()));
    gh.lazySingleton<_i26.GetBooksByTitleUseCase>(
        () => _i26.GetBooksByTitleUseCase(gh<_i9.LibraryRepository>()));
    gh.lazySingleton<_i27.GetBooksUseCase>(
        () => _i27.GetBooksUseCase(gh<_i9.LibraryRepository>()));
    gh.lazySingleton<_i28.GetRatingByBookIdUseCase>(
        () => _i28.GetRatingByBookIdUseCase(gh<_i9.LibraryRepository>()));
    gh.lazySingleton<_i29.GetRatingsByUserIdUseCase>(
        () => _i29.GetRatingsByUserIdUseCase(gh<_i9.LibraryRepository>()));
    gh.lazySingleton<_i30.GetRecommendedBooksUseCase>(
        () => _i30.GetRecommendedBooksUseCase(gh<_i9.LibraryRepository>()));
    gh.lazySingleton<_i31.GetUserHistoryByBookIdUseCase>(
        () => _i31.GetUserHistoryByBookIdUseCase(gh<_i9.LibraryRepository>()));
    gh.lazySingleton<_i32.GetUserHistoryUseCase>(
        () => _i32.GetUserHistoryUseCase(gh<_i9.LibraryRepository>()));
    gh.factory<_i33.LibraryUseCases>(() => _i33.LibraryUseCases(
          getBooksByGenreUseCase: gh<_i24.GetBooksByGenreUseCase>(),
          getBooksUseCase: gh<_i27.GetBooksUseCase>(),
          searchBookUseCase: gh<_i12.SearchBookUseCase>(),
          getBooksByAuthorUseCase: gh<_i23.GetBooksByAuthorUseCase>(),
          getBooksByTitleUseCase: gh<_i26.GetBooksByTitleUseCase>(),
          addBookToHistoryUseCase: gh<_i20.AddBookToHistoryUseCase>(),
          deleteBookFromHistoryUseCase: gh<_i21.DeleteBookFromHistoryUseCase>(),
          getUserHistoryByBookIdUseCase:
              gh<_i31.GetUserHistoryByBookIdUseCase>(),
          updateBookInHistoryUseCase: gh<_i16.UpdateBookInHistoryUseCase>(),
          getRatingByBookIdUseCase: gh<_i28.GetRatingByBookIdUseCase>(),
          rateBookUseCase: gh<_i11.RateBookUseCase>(),
          updateRatingUseCase: gh<_i17.UpdateRatingUseCase>(),
          deleteRatingUseCase: gh<_i22.DeleteRatingUseCase>(),
          getUserHistoryUseCase: gh<_i32.GetUserHistoryUseCase>(),
          getRatingsByUserIdUseCase: gh<_i29.GetRatingsByUserIdUseCase>(),
          getBooksByIdsUseCase: gh<_i25.GetBooksByIdsUseCase>(),
          getRecommendedBooksUseCase: gh<_i30.GetRecommendedBooksUseCase>(),
        ));
    return this;
  }
}
