
import 'package:booksphere/modules/component_modules/user_detail_component/domain/entities/booksphere_user.dart';

abstract class RegisterEvent{}

class RegisterButtonPressed extends RegisterEvent{
  final BooksphereUser user;

  RegisterButtonPressed(this.user);
}

class LoginButtonPressed extends RegisterEvent{
  final String email;
  final String password;

  LoginButtonPressed(this.email, this.password);
}