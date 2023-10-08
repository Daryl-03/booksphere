
import 'package:booksphere/modules/component_modules/user_detail_component/domain/entities/booksphere_user.dart';
import 'package:booksphere/modules/component_modules/library_component/domain/entities/user_history.dart';
import 'package:injectable/injectable.dart';


abstract class UserDataRepository {

  Future<void> updateUserData(BooksphereUser user);

  Future<BooksphereUser?> getUserData();

}