// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_type_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductTypeFilter _$ProductTypeFilterFromJson(Map<String, dynamic> json) =>
    ProductTypeFilter(
      page: (json['page'] as num?)?.toDouble() ?? 0,
      size: (json['size'] as num?)?.toDouble() ?? 100,
    );

Map<String, dynamic> _$ProductTypeFilterToJson(ProductTypeFilter instance) =>
    <String, dynamic>{
      'page': instance.page,
      'size': instance.size,
    };
