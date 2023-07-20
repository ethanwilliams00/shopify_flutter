import 'package:shopify_flutter/models/src/product/price_v_2/price_v_2.dart';

class CartCost {
  CartCost({
    PriceV2? checkoutChargeAmount,
    PriceV2? subtotalAmount,
    required bool subtotalAmountEstimated,
    PriceV2? totalAmount,
    required bool totalAmountEstimated,
    PriceV2? totalDutyAmount,
    required bool totalDutyAmountEstimated,
    PriceV2? totalTaxAmount,
    required bool totalTaxAmountEstimated,
  });

  static CartCost fromGraphJson(Map<String, dynamic> json) {
    return CartCost(
      checkoutChargeAmount: json['checkoutChargeAmount'] == null
          ? null
          : PriceV2.fromJson(json['checkoutChargeAmount']),
      subtotalAmount: json['subtotalAmount'] == null
          ? null
          : PriceV2.fromJson(json['subtotalAmount']),
      subtotalAmountEstimated: json['subtotalAmountEstimated'] ?? false,
      totalAmount: json['totalAmount'] == null
          ? null
          : PriceV2.fromJson(json['totalAmount']),
      totalAmountEstimated: json['totalAmountEstimated'] ?? false,
      totalDutyAmount: json['totalDutyAmount'] == null
          ? null
          : PriceV2.fromJson(json['totalDutyAmount']),
      totalDutyAmountEstimated: json['totalDutyAmountEstimated'] ?? false,
      totalTaxAmount: json['totalTaxAmount'] == null
          ? null
          : PriceV2.fromJson(json['totalTaxAmount']),
      totalTaxAmountEstimated: json['totalTaxAmountEstimated'] ?? false,
    );
  }
}
