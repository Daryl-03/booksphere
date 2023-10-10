
import 'package:booksphere/modules/component_modules/common/utils/pagination_info.dart';
import 'package:equatable/equatable.dart';

class PaginatedEntity<T> extends Equatable{
  final PaginationInfo meta;
  final List<T> data;

  const PaginatedEntity({
    required this.meta,
    required this.data,
  });

  factory PaginatedEntity.initial() => PaginatedEntity(
    meta: PaginationInfo.initial(),
    data: const [],
  );

  @override
  List<Object?> get props => [meta, data];
}