// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'line_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LineItem _$$_LineItemFromJson(Map<String, dynamic> json) => _$_LineItem(
      quantity: json['quantity'] as int,
      discountAllocations: (json['discountAllocations'] as List<dynamic>)
          .map((e) => DiscountAllocations.fromJson(e as Map<String, dynamic>))
          .toList(),
      customAttributes: (json['customAttributes'] as List<dynamic>?)
              ?.map((e) => Attribute.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      variantId: json['variantId'] as String?,
      id: json['id'] as String?,
      variant: json['variant'] == null
          ? null
          : ProductVariantCheckout.fromJson(
              json['variant'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_LineItemToJson(_$_LineItem instance) =>
    <String, dynamic>{
      'quantity': instance.quantity,
      'discountAllocations': instance.discountAllocations,
      'customAttributes': instance.customAttributes,
      'variantId': instance.variantId,
      'id': instance.id,
      'variant': instance.variant,
    };
