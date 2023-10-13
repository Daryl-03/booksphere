
import 'package:booksphere/modules/component_modules/user_detail_component/domain/entities/booksphere_user.dart';


abstract class UserDataRepository {

  Future<void> updateUserData(BooksphereUser user);

  Future<BooksphereUser?> getUserData();

}