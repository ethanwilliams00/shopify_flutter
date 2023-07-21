import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shopify_flutter/graphql_operations/storefront/mutations/cart_add_line.dart';
import 'package:shopify_flutter/graphql_operations/storefront/mutations/cart_change_quantity.dart';
import 'package:shopify_flutter/graphql_operations/storefront/mutations/cart_create.dart';
import 'package:shopify_flutter/graphql_operations/storefront/mutations/cart_remove_line.dart';
import 'package:shopify_flutter/graphql_operations/storefront/queries/get_cart.dart';
import 'package:shopify_flutter/mixins/src/shopfiy_error.dart';
import 'package:shopify_flutter/models/src/cart/cart.dart';
import 'package:shopify_flutter/models/src/checkout/line_item/line_item.dart';
import 'package:shopify_flutter/shopify_config.dart';

class ShopifyCart with ShopifyError {
  ShopifyCart._();
  static final ShopifyCart instance = ShopifyCart._();

  GraphQLClient? get _graphQLClient => ShopifyConfig.graphQLClient;

  /// Returns a [Cart] object
  ///
  /// Returns the Cart object of the cart with the [cartId]
  Future<Cart> getCartById(String cartId) async {
    final WatchQueryOptions watchQueryOptions = WatchQueryOptions(
        document: gql(getCartQuery), variables: {'id': cartId});
    QueryResult result = await _graphQLClient!.query(watchQueryOptions);
    checkForError(result);
    return Cart.fromGraphJson(result.data!['cart']);
  }

  /// Returns a [Cart] object
  ///
  /// Returns the new Cart object
  Future<Cart> createCart(Cart cart) async {
    final MutationOptions mutationOptions =
        MutationOptions(document: gql(cartCreateMutation), variables: {
      "input": {
        "buyerIdentity": {
          "deliveryAddressPreferences": [
            ...cart.buyerIdentity.deliveryAddressPreferences
                .map((e) => {
                      "customerAddressId": e.id,
                      "deliveryAddress": {
                        "address1": e.address1,
                        "address2": e.address2,
                        "city": e.city,
                        "company": e.company,
                        "country": e.country,
                        "firstName": e.firstName,
                        "lastName": e.lastName,
                        "phone": e.phone,
                        "province": e.province,
                        "zip": e.zip,
                      }
                    })
                .toList()
          ],
          "email": cart.buyerIdentity.email,
          "phone": cart.buyerIdentity.phone,
        },
        "discountCodes": cart.discountCodes,
        "lines": [
          ...cart.lines
              .map(
                  (e) => {"merchandiseId": e.variantId, "quantity": e.quantity})
              .toList()
        ],
        "note": cart.note,
      }
    });
    final QueryResult result = await _graphQLClient!.mutate(mutationOptions);
    checkForError(result);
    return Cart.fromGraphJson(result.data!['cartCreate']['cart']);
  }

  /// Returns a [Cart] object
  ///
  /// Returns the modified Cart object after adding a [LineItem] to the cart with [cartId]
  Future<Cart> addCartLineToCart(String cartId, LineItem line) async {
    final MutationOptions mutationOptions =
        MutationOptions(document: gql(cartAddLineMutation), variables: {
      "cartId": cartId,
      "lines": [
        {
          "quantity": line.quantity,
          "merchandiseId": line.variantId,
        }
      ]
    });
    final QueryResult result = await _graphQLClient!.mutate(mutationOptions);
    checkForError(result);
    return Cart.fromGraphJson(result.data!['cartLinesAdd']['cart']);
  }

  /// Returns a [Cart] object
  ///
  /// Returns the modified Cart object after removing a [LineItem] from the cart with [cartId]
  Future<Cart> removeCartLineFromCart(String cartId, LineItem line) async {
    final MutationOptions mutationOptions =
        MutationOptions(document: gql(cartRemoveLineMutation), variables: {
      "cartId": cartId,
      "lineIds": [line.id]
    });
    final QueryResult result = await _graphQLClient!.mutate(mutationOptions);
    checkForError(result);
    return Cart.fromGraphJson(result.data!['cartLinesRemove']['cart']);
  }

  /// Returns a [Cart] object
  ///
  /// Returns the modified Cart object after changing the quantity of a [LineItem] from the cart with [cartId]
  Future<Cart> changeCartLineQuantity(String cartId, LineItem line) async {
    final MutationOptions mutationOptions =
        MutationOptions(document: gql(cartChangeQuantityMutation), variables: {
      "cartId": cartId,
      "lines": {
        "id": line.id,
        "quantity": line.quantity,
      }
    });
    final QueryResult result = await _graphQLClient!.mutate(mutationOptions);
    checkForError(result);
    return Cart.fromGraphJson(result.data!['cartLinesUpdate']['cart']);
  }
}
