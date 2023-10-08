
import 'package:json_annotation/json_annotation.dart';

enum BookState{
  @JsonValue('READ')
  read,
  @JsonValue('READING')
  reading,
  @JsonValue('WANT_TO_READ')
  wantToRead,
}