import 'package:booksphere/modules/component_modules/user_detail_component/domain/entities/booksphere_user.dart';
import 'package:booksphere/modules/component_modules/user_detail_component/domain/repository/auth_repository.dart';
import 'package:booksphere/modules/component_modules/user_detail_component/domain/repository/user_data_repository.dart';
import 'package:booksphere/modules/component_modules/user_detail_component/exceptions/auth_exception.dart';
import 'package:booksphere/utils/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {

  AuthRepositoryImpl(this.userDataRepository);

  final UserDataRepository userDataRepository;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  bool isSignedIn() {
    return signedInUser != null;
  }

  @override
  Future<bool> signInWithEmail(String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      Logger().d("user signed in");
      signedInUser = await userDataRepository.getUserData();
      Logger().d(signedInUser);
      Logger().d("user data fetched in auth repo");

      return true;
    } on FirebaseAuthException catch (e){
      if (e.code == 'user-not-found'){
        throw AuthException("There is no user with the corresponding email");
      } else if (e.code == 'wrong-password'){
        throw AuthException("Invalid password");
      } else {
        throw AuthException(e.code);
      }
    }
  }

  @override
  Future<void> signOut() {
    signedInUser = null;
    return _firebaseAuth.signOut();
  }

  @override
  Future<bool> signUpWithEmail(BooksphereUser user) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(
          email: user.email,
          password: user.password
      );
      user = user.copyWith(id: userCredential.user!.uid);
      signedInUser = user;
      await userDataRepository.updateUserData(user);

      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw AuthException('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw AuthException('The account already exists for that email.');
      }
    }
    return false;
  }
}