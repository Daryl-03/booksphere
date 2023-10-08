

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';


class BooksphereUser extends Equatable {

  const BooksphereUser({
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

  BooksphereUser copyWith({
    String? id,
    String? email,
    String? password,
    String? username,
    String? firstName,
    String? lastName,
    String? avatar,
    bool? isActive
  }) {
    return BooksphereUser(
      id: id ?? this.id,
      email: email ?? this.email,
      password: password ?? this.password,
      username: username ?? this.username,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      avatar: avatar ?? this.avatar,
      isActive: isActive ?? this.isActive
    );
  }

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

}