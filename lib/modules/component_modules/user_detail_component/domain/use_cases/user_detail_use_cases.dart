

import 'package:booksphere/modules/component_modules/user_detail_component/domain/use_cases/sign_in_with_email_use_case.dart';
import 'package:booksphere/modules/component_modules/user_detail_component/domain/use_cases/sign_out_use_case.dart';
import 'package:booksphere/modules/component_modules/user_detail_component/domain/use_cases/sign_up_with_email_use_case.dart';
import 'package:booksphere/modules/component_modules/user_detail_component/domain/use_cases/update_user_data_use_case.dart';
import 'package:injectable/injectable.dart';

import 'get_user_data_use_case.dart';

@injectable
class UserDetailUseCases {

  UserDetailUseCases({
    required this.signInWithEmailUseCase,
    required this.signUpWithEmailUseCase,
    required this.signOutUseCase,
    required this.updateUserDataUseCase,
    required this.getUserDataUseCase,
  });

  final SignInWithEmailUseCase signInWithEmailUseCase;
  final SignUpWithEmailUseCase signUpWithEmailUseCase;
  final SignOutUseCase signOutUseCase;

  final UpdateUserDataUseCase updateUserDataUseCase;
  final GetUserDataUseCase getUserDataUseCase;
}