/// Query to get collection by id
const String getCollectionByIdQuery = r'''
query getCollectionById($id: ID!) {
  collection(id: $id) {
    id
    description
    descriptionHtml
    handle
    title
    updatedAt
    image {
      altText
      id
      originalSrc
    }
    products(first: 250) {
      edges {
        node {
          variants(first: 250) {
            edges {
              node {
                title
                image {
                  altText
                  id
                  originalSrc
                }
                priceV2 {
                  amount
                  currencyCode
                }
                compareAtPriceV2 {
                  amount
                  currencyCode
                }
                weight
                weightUnit
                sku
                requiresShipping
                selectedOptions {
                  name
                  value
                }
                availableForSale
                quantityAvailable
                id
              }
            }
          }
          availableForSale
          collections(first: 250) {
            edges {
              node {
                description
                descriptionHtml
                id
                handle
                title
                updatedAt
              }
            }
          }
          createdAt
          description
          descriptionHtml
          handle
          id
          images(first: 10) {
            edges {
              node {
                altText
                id
                originalSrc
              }
            }
          }
          onlineStoreUrl
          productType
          publishedAt
          tags
          title
          updatedAt
          vendor
        }
        cursor
      }
      pageInfo {
        hasNextPage
      }
    }
  }
}
''';
