
import 'package:booksphere/modules/component_modules/user_detail_component/domain/entities/booksphere_user.dart';
import 'package:injectable/injectable.dart';


abstract class AuthRepository {
  Future<bool> signInWithEmail(String email, String password);

  Future<bool> signUpWithEmail(BooksphereUser user);

  Future<void> signOut();

  bool isSignedIn();
}