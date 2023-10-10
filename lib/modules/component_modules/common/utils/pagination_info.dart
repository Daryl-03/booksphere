
import 'package:json_annotation/json_annotation.dart';

part 'pagination_info.g.dart';

@JsonSerializable()
class PaginationInfo {
  int totalPages;
  int page;
  int pageSize;
  int totalRecords;

  PaginationInfo({
    required this.totalPages,
    required this.page,
    required this.pageSize,
    required this.totalRecords,
  });

  factory PaginationInfo.initial() => PaginationInfo(
    totalPages: 0,
    page: 0,
    pageSize: 0,
    totalRecords: 0,
  );

  factory PaginationInfo.fromJson(Map<String, dynamic> json) => _$PaginationInfoFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationInfoToJson(this);

}