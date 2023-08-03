import 'package:shopify_flutter/models/src/product/price_v_2/price_v_2.dart';
import 'package:shopify_flutter/models/src/product/product.dart';
import 'package:shopify_flutter/models/src/product/shopify_image/shopify_image.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_variant_checkout.freezed.dart';
part 'product_variant_checkout.g.dart';

@freezed
class ProductVariantCheckout with _$ProductVariantCheckout {
  const ProductVariantCheckout._();

  factory ProductVariantCheckout({
    required PriceV2 priceV2,
    required String title,
    required bool availableForSale,
    required String sku,
    required bool requiresShipping,
    required String id,
    Product? product,
    ShopifyImage? image,
    PriceV2? compareAtPrice,
    double? weight,
    String? weightUnit,
    @Default(0) int quantityAvailable,
  }) = _ProductVariantCheckout;

  static ProductVariantCheckout fromGraphJson(Map<String, dynamic> json) {
    return ProductVariantCheckout(
        priceV2: PriceV2.fromJson(json['priceV2']),
        title: json['title'],
        availableForSale: json['availableForSale'],
        sku: json['sku'],
        requiresShipping: json['requiresShipping'],
        id: json['id'],
        product: json['product'] == null
            ? null
            : Product.fromGraphJson(json['product']),
        image: ShopifyImage.fromGraphJson(json['image']));
  }

  factory ProductVariantCheckout.fromJson(Map<String, dynamic> json) =>
      _$ProductVariantCheckoutFromJson(json);
}
