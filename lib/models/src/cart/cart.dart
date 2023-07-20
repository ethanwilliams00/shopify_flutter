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
    for (var item in json['discountAllocations']) {
      discountAllocations.add(DiscountAllocations.fromJson(item));
    }
    List<DiscountCode> discountCodes = [];
    for (var item in json['discountCodes']) {
      discountCodes.add(DiscountCode.fromGraphJson(item));
    }
    List<LineItem> lines = [];
    for (var item in json['lines']['edges']) {
      lines.add(LineItem.fromJson(item['node']));
    }
    return Cart(
      buyerIdentity: BuyerIdentity.fromGraphJson(json['buyerIdentity']),
      checkoutUrl: json['checkoutUrl'] ?? "",
      cost: CartCost.fromGraphJson(json['cost']),
      createdAt: DateTime.parse(json['createdAt']),
      discountAllocations: discountAllocations,
      discountCodes: discountCodes,
      id: json['id'] ?? "",
      note: json['note'] ?? "",
      totalQuantity: json['totalQuantity'] ?? 0,
      updatedAt: DateTime.parse(json['updatedAt']),
      lines: lines,
    );
  }
}
