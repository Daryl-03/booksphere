import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'genre_spring_model.g.dart';

@JsonSerializable()
class GenreSpringModel extends Equatable{

  const GenreSpringModel({
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

  factory GenreSpringModel.fromJson(Map<String, dynamic> json) => _$GenreSpringModelFromJson(json);

  Map<String, dynamic> toJson() => _$GenreSpringModelToJson(this);
}