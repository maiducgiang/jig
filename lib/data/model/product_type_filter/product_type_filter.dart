import 'package:json_annotation/json_annotation.dart';
part 'product_type_filter.g.dart';

@JsonSerializable()
class ProductTypeFilter {
  final double page;
  final double size;

  ProductTypeFilter({this.page = 0, this.size = 100});
  factory ProductTypeFilter.fromJson(Map<String, dynamic> json) =>
      _$ProductTypeFilterFromJson(json);

  Map<String, dynamic> toJson() => _$ProductTypeFilterToJson(this);
}
