/// Query to get cart by id
const String getCartQuery = r'''
query getCartById($id: ID!) {
  cart(id: $id) {
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
            }
          }
          quantity
        }
      }
    }
  }
}
''';