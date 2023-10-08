// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firebase_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FirebaseUserModel _$FirebaseUserModelFromJson(Map<String, dynamic> json) =>
    FirebaseUserModel(
      id: json['id'] as String?,
      email: json['email'] as String,
      password: json['password'] as String,
      username: json['username'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      avatar: json['avatar'] as String?,
      isActive: json['isActive'] as bool? ?? true,
    );

Map<String, dynamic> _$FirebaseUserModelToJson(FirebaseUserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'password': instance.password,
      'username': instance.username,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'avatar': instance.avatar,
      'isActive': instance.isActive,
    };
