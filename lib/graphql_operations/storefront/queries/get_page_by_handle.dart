/// Query to get page by handle
const String getPageByHandleQuery = r'''
query($handle : String!){
  pageByHandle(handle: $handle) {
    id
    handle
    title
    body
    bodySummary
    createdAt
    updatedAt
  }
}
''';
