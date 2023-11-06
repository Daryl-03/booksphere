
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'author_spring_model.g.dart';

@JsonSerializable()
class AuthorSpringModel extends Equatable {

  const AuthorSpringModel({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  @override
  List<Object?> get props => [
    id,
    name,
  ];

  factory AuthorSpringModel.fromJson(Map<String, dynamic> json) => _$AuthorSpringModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorSpringModelToJson(this);
}