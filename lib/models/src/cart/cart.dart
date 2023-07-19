import 'package:shopify_flutter/models/src/cart/buyer_identity.dart';
import 'package:shopify_flutter/models/src/cart/cart_cost.dart';
import 'package:shopify_flutter/models/src/cart/discount_code.dart';
import 'package:shopify_flutter/models/src/checkout/line_item/line_item.dart';
import 'package:shopify_flutter/models/src/order/discount_allocations/discount_allocations.dart';

class Cart {
  BuyerIdentity buyerIdentity;
  String checkoutUrl;
  CartCost cost;
  DateTime createdAt;
  List<DiscountAllocations> discountAllocations;
  List<DiscountCode> discountCodes;
  String id;
  String note;
  int totalQuantity;
  DateTime updatedAt;
  List<LineItem> lines;
  Cart({
    required this.buyerIdentity,
    required this.checkoutUrl,
    required this.cost,
    required this.createdAt,
    required this.discountAllocations,
    required this.discountCodes,
    required this.id,
    required this.note,
    required this.totalQuantity,
    required this.updatedAt,
    required this.lines,
  });

  static Cart fromGraphJson(Map<String, dynamic> json) {
    List<DiscountAllocations> discountAllocations = [];
    for (var item in (json['node'] ??
        {'discountAllocations': []})['discountAllocations']) {
      discountAllocations.add(DiscountAllocations.fromJson(item));
    }
    List<DiscountCode> discountCodes = [];
    for (var item in (json['node'] ?? {'discountCodes': []})['discountCodes']) {
      discountCodes.add(DiscountCode.fromGraphJson(item));
    }
    List<LineItem> lines = [];
    for (var item in (json['node'] ?? {'lines': []})['lines']) {
      lines.add(LineItem.fromJson(item));
    }
    return Cart(
      buyerIdentity: BuyerIdentity.fromGraphJson(
          (json['node'] ?? {'buyerIdentity': {}})['buyerIdentity']),
      checkoutUrl: (json['node'] ?? {})['checkoutUrl'] ?? "",
      cost: CartCost.fromGraphJson((json['node'] ?? {})['cost']),
      createdAt: (json['node'] ?? {})['createdAt'],
      discountAllocations: discountAllocations,
      discountCodes: discountCodes,
      id: (json['node'] ?? {})['id'] ?? "",
      note: (json['node'] ?? {})['note'] ?? "",
      totalQuantity: (json['node'] ?? {})['totalQuantity'] ?? 0,
      updatedAt: (json['node'] ?? {})['updatedAt'],
      lines: lines,
    );
  }
}
