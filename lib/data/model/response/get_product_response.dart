import 'package:json_annotation/json_annotation.dart';
part 'get_product_response.g.dart';

@JsonSerializable()
class ProductTypeResponse {
  final ProductTypeData? data;
  final Map<String, String>? errors;

  ProductTypeResponse({this.data, this.errors});
  factory ProductTypeResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductTypeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductTypeResponseToJson(this);
}

@JsonSerializable()
class ProductTypeData {
  final ProductGetTypes? productGetTypes;

  ProductTypeData({required this.productGetTypes});
  factory ProductTypeData.fromJson(Map<String, dynamic> json) =>
      _$ProductTypeDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProductTypeDataToJson(this);
}

@JsonSerializable()
class ProductGetTypes {
  final int? total;
  final int? count;
  final List<Product>? productTypes;

  ProductGetTypes({this.total, this.count, this.productTypes});
  factory ProductGetTypes.fromJson(Map<String, dynamic> json) =>
      _$ProductGetTypesFromJson(json);

  Map<String, dynamic> toJson() => _$ProductGetTypesToJson(this);
}

@JsonSerializable()
class Product {
  final String? id;
  final String? name;
  final String? code;

  Product({required this.id, required this.name, required this.code});
  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
