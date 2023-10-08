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
import 'package:booksphere/modules/component_modules/library_component/domain/use_cases/get_books_by_genre_use_case.dart'
    as _i17;
import 'package:booksphere/modules/component_modules/library_component/domain/use_cases/get_books_use_case.dart'
    as _i18;
import 'package:booksphere/modules/component_modules/library_component/domain/use_cases/library_use_cases.dart'
    as _i19;
import 'package:booksphere/modules/component_modules/library_component/domain/use_cases/search_book_use_case.dart'
    as _i11;
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
    as _i12;
import 'package:booksphere/modules/component_modules/user_detail_component/domain/use_cases/sign_out_use_case.dart'
    as _i13;
import 'package:booksphere/modules/component_modules/user_detail_component/domain/use_cases/sign_up_with_email_use_case.dart'
    as _i14;
import 'package:booksphere/modules/component_modules/user_detail_component/domain/use_cases/update_user_data_use_case.dart'
    as _i15;
import 'package:booksphere/modules/component_modules/user_detail_component/domain/use_cases/user_detail_use_cases.dart'
    as _i16;
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
    gh.lazySingleton<_i11.SearchBookUseCase>(
        () => _i11.SearchBookUseCase(gh<_i9.LibraryRepository>()));
    gh.lazySingleton<_i12.SignInWithEmailUseCase>(
        () => _i12.SignInWithEmailUseCase(gh<_i6.AuthRepository>()));
    gh.lazySingleton<_i13.SignOutUseCase>(
        () => _i13.SignOutUseCase(gh<_i6.AuthRepository>()));
    gh.lazySingleton<_i14.SignUpWithEmailUseCase>(
        () => _i14.SignUpWithEmailUseCase(gh<_i6.AuthRepository>()));
    gh.lazySingleton<_i15.UpdateUserDataUseCase>(
        () => _i15.UpdateUserDataUseCase(gh<_i4.UserDataRepository>()));
    gh.factory<_i16.UserDetailUseCases>(() => _i16.UserDetailUseCases(
          signInWithEmailUseCase: gh<_i12.SignInWithEmailUseCase>(),
          signUpWithEmailUseCase: gh<_i14.SignUpWithEmailUseCase>(),
          signOutUseCase: gh<_i13.SignOutUseCase>(),
          updateUserDataUseCase: gh<_i15.UpdateUserDataUseCase>(),
          getUserDataUseCase: gh<_i8.GetUserDataUseCase>(),
        ));
    gh.lazySingleton<_i17.GetBooksByGenreUseCase>(
        () => _i17.GetBooksByGenreUseCase(gh<_i9.LibraryRepository>()));
    gh.lazySingleton<_i18.GetBooksUseCase>(
        () => _i18.GetBooksUseCase(gh<_i9.LibraryRepository>()));
    gh.factory<_i19.LibraryUseCases>(() => _i19.LibraryUseCases(
          getBooksByGenreUseCase: gh<_i17.GetBooksByGenreUseCase>(),
          getBooksUseCase: gh<_i18.GetBooksUseCase>(),
          searchBookUseCase: gh<_i11.SearchBookUseCase>(),
        ));
    return this;
  }
}
