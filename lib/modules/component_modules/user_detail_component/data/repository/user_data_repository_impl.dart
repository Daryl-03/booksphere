
import 'package:booksphere/modules/component_modules/user_detail_component/data/model/firebase_user_model.dart';
import 'package:booksphere/modules/component_modules/user_detail_component/domain/entities/booksphere_user.dart';
import 'package:booksphere/modules/component_modules/library_component/domain/entities/user_history.dart';
import 'package:booksphere/modules/component_modules/user_detail_component/domain/repository/user_data_repository.dart';
import 'package:booksphere/utils/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@Injectable(as: UserDataRepository)
class UserDataRepositoryImpl implements UserDataRepository{

  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<BooksphereUser?> getUserDataById(String id) async {
    Map<String, dynamic> profile = {};
    // Logger().d("fetching user data");
    try {
      final DocumentSnapshot<Map<String, dynamic>> userSnapshot = await _firebaseFirestore.collection('users').doc(id).get();
      profile = userSnapshot.data()!['profile'];
      // Logger().d(profile);
      // Logger().d("user data fetched");
      signedInUser = FirebaseUserModel.fromJson(profile).toEntity();
      return signedInUser;
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<void> updateUserData(BooksphereUser user) {
    return _firebaseFirestore.collection('users').doc(user.id).set(
        {'profile': FirebaseUserModel.fromEntity(user).toJson()}
    );
  }

  @override
  Future<BooksphereUser?> getUserData() {
    return getUserDataById(_firebaseAuth.currentUser!.uid);
  }

}