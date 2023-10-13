
import 'package:booksphere/modules/component_modules/common/utils/pagination_info.dart';
import 'package:booksphere/modules/component_modules/library_component/utils/ModelConverter.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'paginated_spring_model.g.dart';

@JsonSerializable()
class PaginatedSpringModel<T> extends Equatable{
  final PaginationInfo meta;
  @ModelConverter()
  final List<T> data;

  const PaginatedSpringModel({
    required this.meta,
    required this.data,
  });


  @override
  List<Object?> get props => [meta, data];

  factory PaginatedSpringModel.fromJson(Map<String, dynamic> json) => _$PaginatedSpringModelFromJson(json);

  Map<String, dynamic> toJson() => _$PaginatedSpringModelToJson(this);
}