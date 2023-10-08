
import 'package:booksphere/modules/component_modules/user_detail_component/domain/entities/booksphere_user.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'firebase_user_model.g.dart';

@JsonSerializable()
class FirebaseUserModel extends Equatable {

  const FirebaseUserModel({
    this.id,
    required this.email,
    required this.password,
    required this.username,
    required this.firstName,
    required this.lastName,
    this.avatar,
    this.isActive = true
  });

  final String? id;
  final String email;
  final String password;
  final String username;
  final String firstName;
  final String lastName;
  final String? avatar;
  final bool isActive;

  @override
  List<Object?> get props => [
    id,
    email,
    password,
    username,
    firstName,
    lastName,
    avatar,
    isActive
  ];

  BooksphereUser toEntity() {
    return BooksphereUser(
      id: id,
      email: email,
      password: password,
      username: username,
      firstName: firstName,
      lastName: lastName,
      avatar: avatar,
      isActive: isActive
    );
  }

  factory FirebaseUserModel.fromEntity(BooksphereUser user) {
    return FirebaseUserModel(
      id: user.id,
      email: user.email,
      password: user.password,
      username: user.username,
      firstName: user.firstName,
      lastName: user.lastName,
      avatar: user.avatar,
      isActive: user.isActive
    );
  }

  factory FirebaseUserModel.fromJson(Map<String, dynamic> json) => _$FirebaseUserModelFromJson(json);

  Map<String, dynamic> toJson() => _$FirebaseUserModelToJson(this);
}