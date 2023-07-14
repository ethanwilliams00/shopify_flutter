/// Query to get menu by handle
const String getMenuByHandleQuery = r'''
query($handle : String!) {
  menu(handle: $handle) {
    handle
    id
    items {
      id
      items {
        id
        resource
        resourceId
        tags
        title
        type
        url
      }
      resource
      resourceId
      tags
      title
      type
      url
    }
    itemsCount
    title
  }
}
''';
