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
    for (var item in json['deliveryAddressPreferences']) {
      deliveryAddressPreferences.add(MailingAddress.fromJson(item));
    }
    List<String> walletPreferences = [];
    for (var item in json['walletPreferences']) {
      walletPreferences.add(item);
    }
    return BuyerIdentity(
      countryCode: json['countryCode'] ?? "",
      customer: ShopifyUser.fromJson(json['customer'] ?? {}),
      deliveryAddressPreferences: deliveryAddressPreferences,
      email: json['email'] ?? "",
      phone: json['phone'] ?? "",
      walletPreferences: walletPreferences,
    );
  }
}
