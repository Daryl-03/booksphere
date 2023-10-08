
import 'package:booksphere/modules/component_modules/user_detail_component/domain/use_cases/user_detail_use_cases.dart';
import 'package:booksphere/modules/component_modules/user_detail_component/exceptions/auth_exception.dart';
import 'package:booksphere/modules/ui_modules/auth_module/register/register_event.dart';
import 'package:booksphere/modules/ui_modules/auth_module/register/register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {

  RegisterBloc() : super(RegisterState.initial()){
      on<RegisterButtonPressed>(_registerUser);
      on<LoginButtonPressed>(_loginUser);
  }

  final UserDetailUseCases useCases = GetIt.instance.get<UserDetailUseCases>();

  void _registerUser(RegisterButtonPressed event, Emitter<RegisterState> emit) async{
    try {
      emit(state.copyWith(isAuthenticating: true));
      await useCases.signUpWithEmailUseCase(event.user);
      emit(state.copyWith(isAuthenticating: false));
      // Logger().i('register');
    } on AuthException catch (e) {
      // Logger().e(e.message);
      emit(state.copyWith(error: e.message));
    }
  }

  void _loginUser(LoginButtonPressed event, Emitter<RegisterState> emit) async{
    try {
      emit(state.copyWith(isAuthenticating: true));
      var logged = await useCases.signInWithEmailUseCase(event.email, event.password);
      if (logged) {
        emit(state.copyWith(isAuthenticating: false));
      }
      // Logger().i('Login');
    } on AuthException catch (e) {
      // Logger().e(e.message);
      emit(state.copyWith(error: e.message, isAuthenticating: false));
    }
  }


}
