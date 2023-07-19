import 'package:shopify_flutter/models/models.dart';
import 'package:shopify_flutter/models/src/checkout/mailing_address/mailing_address.dart';

class BuyerIdentity {
  String countryCode;
  ShopifyUser customer;
  List<MailingAddress> deliveryAddressPreferences;
  String email;
  String phone;
  List<String> walletPreferences;
  BuyerIdentity({
    required this.countryCode,
    required this.customer,
    required this.deliveryAddressPreferences,
    required this.email,
    required this.phone,
    required this.walletPreferences,
  });

  static BuyerIdentity fromGraphJson(Map<String, dynamic> json) {
    List<MailingAddress> deliveryAddressPreferences = [];
    for (var item in (json['node'] ??
        {'deliveryAddressPreferences': []})['deliveryAddressPreferences']) {
      deliveryAddressPreferences.add(MailingAddress.fromJson(item));
    }
    List<String> walletPreferences = [];
    for (var item
        in (json['node'] ?? {'walletPreferences': []})['walletPreferences']) {
      walletPreferences.add(item);
    }
    return BuyerIdentity(
      countryCode: (json['node'] ?? {})['countryCode'] ?? "",
      customer: ShopifyUser.fromJson((json['node'] ?? {})['customer']),
      deliveryAddressPreferences: deliveryAddressPreferences,
      email: (json['node'] ?? {})['email'] ?? "",
      phone: (json['node'] ?? {})['phone'] ?? "",
      walletPreferences: walletPreferences,
    );
  }
}
