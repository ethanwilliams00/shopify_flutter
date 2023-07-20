/// mutation to remove a line item from a cart
const String cartRemoveLineMutation = r'''
mutation cartLinesRemove($lineIds: [ID!]!, $cartId: ID!) {
  cartLinesRemove(lineIds: $lineIds, cartId: $cartId) {
    userErrors{
      field
      message
    }
    cart {
      buyerIdentity {
        countryCode
        customer {
          id
        }
        deliveryAddressPreferences {
          ... on MailingAddress {
            address1
            address2
            city
            company
            country
            countryCodeV2
            firstName
            formatted
            formattedArea
            id
            lastName
            longitude
            name
            phone
            province
            provinceCode
            zip
          }
        }
        email
        phone
        walletPreferences
      }
      checkoutUrl
      cost {
        checkoutChargeAmount {
          amount
          currencyCode
        }
        subtotalAmount {
          amount
          currencyCode
        }
        subtotalAmountEstimated
        totalAmount {
          amount
          currencyCode
        }
        totalAmountEstimated
        totalDutyAmount {
          amount
          currencyCode
        }
        totalDutyAmountEstimated
        totalTaxAmount {
          amount
          currencyCode
        }
        totalTaxAmountEstimated
      }
      createdAt
      discountAllocations {
        discountedAmount {
          amount
          currencyCode
        }
      }
      discountCodes {
        applicable
        code
      }
      id
      note
      totalQuantity
      updatedAt
      lines(first: 250) {
        edges {
          node {
            cost {
              amountPerQuantity {
                amount
                currencyCode
              }
              compareAtAmountPerQuantity {
                amount
                currencyCode
              }
              subtotalAmount {
                amount
                currencyCode
              }
              totalAmount {
                amount
                currencyCode
              }
            }
            discountAllocations {
              discountedAmount {
                amount
                currencyCode
              }
            }
            id
            merchandise {
              ... on ProductVariant {
                id
                image {
                  id
                  url
                  altText
                }
                requiresShipping
                sku
                title
                priceV2 {
                  amount
                  currencyCode
                }
                availableForSale
              }
            }
            quantity
          }
        }
      }
    }
  }
}
''';
