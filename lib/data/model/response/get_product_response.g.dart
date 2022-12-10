// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_product_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductTypeResponse _$ProductTypeResponseFromJson(Map<String, dynamic> json) =>
    ProductTypeResponse(
      data: json['data'] == null
          ? null
          : ProductTypeData.fromJson(json['data'] as Map<String, dynamic>),
      errors: (json['errors'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
    );

Map<String, dynamic> _$ProductTypeResponseToJson(
        ProductTypeResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'errors': instance.errors,
    };

ProductTypeData _$ProductTypeDataFromJson(Map<String, dynamic> json) =>
    ProductTypeData(
      productGetTypes: json['productGetTypes'] == null
          ? null
          : ProductGetTypes.fromJson(
              json['productGetTypes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductTypeDataToJson(ProductTypeData instance) =>
    <String, dynamic>{
      'productGetTypes': instance.productGetTypes,
    };

ProductGetTypes _$ProductGetTypesFromJson(Map<String, dynamic> json) =>
    ProductGetTypes(
      total: json['total'] as int?,
      count: json['count'] as int?,
      productTypes: (json['productTypes'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductGetTypesToJson(ProductGetTypes instance) =>
    <String, dynamic>{
      'total': instance.total,
      'count': instance.count,
      'productTypes': instance.productTypes,
    };

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['id'] as String?,
      name: json['name'] as String?,
      code: json['code'] as String?,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
    };
