
import 'package:equatable/equatable.dart';

class Author extends Equatable {

  const Author({
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

}