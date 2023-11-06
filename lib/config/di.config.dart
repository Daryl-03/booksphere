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
    as _i11;
import 'package:booksphere/modules/component_modules/library_component/domain/repository/library_repository.dart'
    as _i10;
import 'package:booksphere/modules/component_modules/library_component/domain/use_cases/add_book_to_history_use_case.dart'
    as _i21;
import 'package:booksphere/modules/component_modules/library_component/domain/use_cases/delete_book_from_history_use_case.dart'
    as _i22;
import 'package:booksphere/modules/component_modules/library_component/domain/use_cases/delete_rating_use_case.dart'
    as _i23;
import 'package:booksphere/modules/component_modules/library_component/domain/use_cases/get_books_by_author_use_case.dart'
    as _i24;
import 'package:booksphere/modules/component_modules/library_component/domain/use_cases/get_books_by_genre_use_case.dart'
    as _i25;
import 'package:booksphere/modules/component_modules/library_component/domain/use_cases/get_books_by_ids_use_case.dart'
    as _i26;
import 'package:booksphere/modules/component_modules/library_component/domain/use_cases/get_books_by_title_use_case.dart'
    as _i27;
import 'package:booksphere/modules/component_modules/library_component/domain/use_cases/get_books_use_case.dart'
    as _i28;
import 'package:booksphere/modules/component_modules/library_component/domain/use_cases/get_rating_by_book_id_use_case.dart'
    as _i29;
import 'package:booksphere/modules/component_modules/library_component/domain/use_cases/get_ratings_by_user_id_use_case.dart'
    as _i30;
import 'package:booksphere/modules/component_modules/library_component/domain/use_cases/get_recommended_books_use_case.dart'
    as _i31;
import 'package:booksphere/modules/component_modules/library_component/domain/use_cases/get_user_history_by_book_id_use_case.dart'
    as _i32;
import 'package:booksphere/modules/component_modules/library_component/domain/use_cases/get_user_history_use_case.dart'
    as _i33;
import 'package:booksphere/modules/component_modules/library_component/domain/use_cases/library_use_cases.dart'
    as _i34;
import 'package:booksphere/modules/component_modules/library_component/domain/use_cases/rate_book_use_case.dart'
    as _i12;
import 'package:booksphere/modules/component_modules/library_component/domain/use_cases/search_book_use_case.dart'
    as _i13;
import 'package:booksphere/modules/component_modules/library_component/domain/use_cases/update_book_in_history_use_case.dart'
    as _i17;
import 'package:booksphere/modules/component_modules/library_component/domain/use_cases/update_rating_use_case.dart'
    as _i18;
import 'package:booksphere/modules/component_modules/user_detail_component/data/repository/auth_repository_impl.dart'
    as _i7;
import 'package:booksphere/modules/component_modules/user_detail_component/data/repository/user_data_repository_impl.dart'
    as _i5;
import 'package:booksphere/modules/component_modules/user_detail_component/domain/repository/auth_repository.dart'
    as _i6;
import 'package:booksphere/modules/component_modules/user_detail_component/domain/repository/user_data_repository.dart'
    as _i4;
import 'package:booksphere/modules/component_modules/user_detail_component/domain/use_cases/get_signed_in_user_token.dart'
    as _i8;
import 'package:booksphere/modules/component_modules/user_detail_component/domain/use_cases/get_user_data_use_case.dart'
    as _i9;
import 'package:booksphere/modules/component_modules/user_detail_component/domain/use_cases/sign_in_with_email_use_case.dart'
    as _i14;
import 'package:booksphere/modules/component_modules/user_detail_component/domain/use_cases/sign_out_use_case.dart'
    as _i15;
import 'package:booksphere/modules/component_modules/user_detail_component/domain/use_cases/sign_up_with_email_use_case.dart'
    as _i16;
import 'package:booksphere/modules/component_modules/user_detail_component/domain/use_cases/update_user_data_use_case.dart'
    as _i19;
import 'package:booksphere/modules/component_modules/user_detail_component/domain/use_cases/user_detail_use_cases.dart'
    as _i20;
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
    gh.lazySingleton<_i8.GetSignedInUserTokenUseCase>(
        () => _i8.GetSignedInUserTokenUseCase(gh<_i6.AuthRepository>()));
    gh.lazySingleton<_i9.GetUserDataUseCase>(
        () => _i9.GetUserDataUseCase(gh<_i4.UserDataRepository>()));
    gh.factory<_i10.LibraryRepository>(
        () => _i11.LibraryRepositoryImpl(gh<_i3.SpringBookApiService>()));
    gh.lazySingleton<_i12.RateBookUseCase>(
        () => _i12.RateBookUseCase(gh<_i10.LibraryRepository>()));
    gh.lazySingleton<_i13.SearchBookUseCase>(
        () => _i13.SearchBookUseCase(gh<_i10.LibraryRepository>()));
    gh.lazySingleton<_i14.SignInWithEmailUseCase>(
        () => _i14.SignInWithEmailUseCase(gh<_i6.AuthRepository>()));
    gh.lazySingleton<_i15.SignOutUseCase>(
        () => _i15.SignOutUseCase(gh<_i6.AuthRepository>()));
    gh.lazySingleton<_i16.SignUpWithEmailUseCase>(
        () => _i16.SignUpWithEmailUseCase(gh<_i6.AuthRepository>()));
    gh.lazySingleton<_i17.UpdateBookInHistoryUseCase>(
        () => _i17.UpdateBookInHistoryUseCase(gh<_i10.LibraryRepository>()));
    gh.lazySingleton<_i18.UpdateRatingUseCase>(
        () => _i18.UpdateRatingUseCase(gh<_i10.LibraryRepository>()));
    gh.lazySingleton<_i19.UpdateUserDataUseCase>(
        () => _i19.UpdateUserDataUseCase(gh<_i4.UserDataRepository>()));
    gh.factory<_i20.UserDetailUseCases>(() => _i20.UserDetailUseCases(
          signInWithEmailUseCase: gh<_i14.SignInWithEmailUseCase>(),
          signUpWithEmailUseCase: gh<_i16.SignUpWithEmailUseCase>(),
          signOutUseCase: gh<_i15.SignOutUseCase>(),
          updateUserDataUseCase: gh<_i19.UpdateUserDataUseCase>(),
          getUserDataUseCase: gh<_i9.GetUserDataUseCase>(),
          getSignedInUserTokenUseCase: gh<_i8.GetSignedInUserTokenUseCase>(),
        ));
    gh.lazySingleton<_i21.AddBookToHistoryUseCase>(
        () => _i21.AddBookToHistoryUseCase(gh<_i10.LibraryRepository>()));
    gh.lazySingleton<_i22.DeleteBookFromHistoryUseCase>(
        () => _i22.DeleteBookFromHistoryUseCase(gh<_i10.LibraryRepository>()));
    gh.lazySingleton<_i23.DeleteRatingUseCase>(
        () => _i23.DeleteRatingUseCase(gh<_i10.LibraryRepository>()));
    gh.lazySingleton<_i24.GetBooksByAuthorUseCase>(
        () => _i24.GetBooksByAuthorUseCase(gh<_i10.LibraryRepository>()));
    gh.lazySingleton<_i25.GetBooksByGenreUseCase>(
        () => _i25.GetBooksByGenreUseCase(gh<_i10.LibraryRepository>()));
    gh.lazySingleton<_i26.GetBooksByIdsUseCase>(
        () => _i26.GetBooksByIdsUseCase(gh<_i10.LibraryRepository>()));
    gh.lazySingleton<_i27.GetBooksByTitleUseCase>(
        () => _i27.GetBooksByTitleUseCase(gh<_i10.LibraryRepository>()));
    gh.lazySingleton<_i28.GetBooksUseCase>(
        () => _i28.GetBooksUseCase(gh<_i10.LibraryRepository>()));
    gh.lazySingleton<_i29.GetRatingByBookIdUseCase>(
        () => _i29.GetRatingByBookIdUseCase(gh<_i10.LibraryRepository>()));
    gh.lazySingleton<_i30.GetRatingsByUserIdUseCase>(
        () => _i30.GetRatingsByUserIdUseCase(gh<_i10.LibraryRepository>()));
    gh.lazySingleton<_i31.GetRecommendedBooksUseCase>(
        () => _i31.GetRecommendedBooksUseCase(gh<_i10.LibraryRepository>()));
    gh.lazySingleton<_i32.GetUserHistoryByBookIdUseCase>(
        () => _i32.GetUserHistoryByBookIdUseCase(gh<_i10.LibraryRepository>()));
    gh.lazySingleton<_i33.GetUserHistoryUseCase>(
        () => _i33.GetUserHistoryUseCase(gh<_i10.LibraryRepository>()));
    gh.factory<_i34.LibraryUseCases>(() => _i34.LibraryUseCases(
          getBooksByGenreUseCase: gh<_i25.GetBooksByGenreUseCase>(),
          getBooksUseCase: gh<_i28.GetBooksUseCase>(),
          searchBookUseCase: gh<_i13.SearchBookUseCase>(),
          getBooksByAuthorUseCase: gh<_i24.GetBooksByAuthorUseCase>(),
          getBooksByTitleUseCase: gh<_i27.GetBooksByTitleUseCase>(),
          addBookToHistoryUseCase: gh<_i21.AddBookToHistoryUseCase>(),
          deleteBookFromHistoryUseCase: gh<_i22.DeleteBookFromHistoryUseCase>(),
          getUserHistoryByBookIdUseCase:
              gh<_i32.GetUserHistoryByBookIdUseCase>(),
          updateBookInHistoryUseCase: gh<_i17.UpdateBookInHistoryUseCase>(),
          getRatingByBookIdUseCase: gh<_i29.GetRatingByBookIdUseCase>(),
          rateBookUseCase: gh<_i12.RateBookUseCase>(),
          updateRatingUseCase: gh<_i18.UpdateRatingUseCase>(),
          deleteRatingUseCase: gh<_i23.DeleteRatingUseCase>(),
          getUserHistoryUseCase: gh<_i33.GetUserHistoryUseCase>(),
          getRatingsByUserIdUseCase: gh<_i30.GetRatingsByUserIdUseCase>(),
          getBooksByIdsUseCase: gh<_i26.GetBooksByIdsUseCase>(),
          getRecommendedBooksUseCase: gh<_i31.GetRecommendedBooksUseCase>(),
        ));
    return this;
  }
}
