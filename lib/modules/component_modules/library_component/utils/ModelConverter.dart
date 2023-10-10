import 'package:booksphere/modules/component_modules/library_component/data/model/book_spring_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:logger/logger.dart';

class ModelConverter<T> extends JsonConverter<T, Object?> {
  const ModelConverter();

  @override
  T fromJson(Object? json) {
    if (json is Map<String, dynamic>) {
      if (json.containsKey('bookId') && json.containsKey('isbn')) {
        return BookSpringModel.fromJson(json) as T;
      }
    } else if (json is List<dynamic>) {
      if (json.isEmpty) {
        return [] as T;
      }

      if (json[0] is Map<String, dynamic>) {
        if (json[0].containsKey('bookId') && json[0].containsKey('isbn')) {
          return json.map((e) => BookSpringModel.fromJson(e)).toList() as T;
        }
      }
    }

    throw ArgumentError.value(
      json,
      'json',
      'Cannot convert the provided data.',
    );
  }

  @override
  Object toJson(T object) {
    if (object is BookSpringModel) {
      return object.toJson();
    } else if (object is List<BookSpringModel>) {
      return object.map((e) => e.toJson()).toList();
    } else {
      throw ArgumentError.value(
        object,
        'object',
        'Cannot convert the provided data.',
      );
    }
  }
}
