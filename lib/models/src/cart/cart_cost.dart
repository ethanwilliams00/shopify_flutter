import 'package:shopify_flutter/models/src/product/price_v_2/price_v_2.dart';

class CartCost {
  CartCost({
    required PriceV2 checkoutChargeAmount,
    required PriceV2 subtotalAmount,
    required bool subtotalAmountEstimated,
    required PriceV2 totalAmount,
    required bool totalAmountEstimated,
    required PriceV2 totalDutyAmount,
    required bool totalDutyAmountEstimated,
    required PriceV2 totalTaxAmount,
    required bool totalTaxAmountEstimated,
  });

  static CartCost fromGraphJson(Map<String, dynamic> json) {
    return CartCost(
      checkoutChargeAmount:
          PriceV2.fromJson((json['node'] ?? {})['checkoutChargeAmount']),
      subtotalAmount: PriceV2.fromJson((json['node'] ?? {})['subtotalAmount']),
      subtotalAmountEstimated:
          (json['node'] ?? {})['subtotalAmountEstimated'] ?? false,
      totalAmount: PriceV2.fromJson((json['node'] ?? {})['totalAmount']),
      totalAmountEstimated:
          (json['node'] ?? {})['totalAmountEstimated'] ?? false,
      totalDutyAmount:
          PriceV2.fromJson((json['node'] ?? {})['totalDutyAmount']),
      totalDutyAmountEstimated:
          (json['node'] ?? {})['totalDutyAmountEstimated'] ?? false,
      totalTaxAmount: PriceV2.fromJson((json['node'] ?? {})['totalTaxAmount']),
      totalTaxAmountEstimated:
          (json['node'] ?? {})['totalTaxAmountEstimated'] ?? false,
    );
  }
}
