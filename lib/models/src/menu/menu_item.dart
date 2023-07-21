class MenuItem {
  String id;
  List<MenuItem> items;
  String resourceId;
  List<String> tags;
  String title;
  String type;
  String url;
  MenuItem({
    required this.id,
    required this.items,
    required this.resourceId,
    required this.tags,
    required this.title,
    required this.type,
    required this.url,
  });

  static MenuItem fromGraphJson(Map<String, dynamic> json) {
    List<MenuItem> menuItems = [];
    for (var item in json['items'] ?? []) {
      menuItems.add(MenuItem.fromGraphJson(item));
    }
    List<String> tags = [];
    for (String item in json['tags'] ?? []) {
      tags.add(item);
    }
    return MenuItem(
        id: json['id'],
        items: menuItems,
        resourceId: json['resourceId'],
        tags: tags,
        title: json['title'],
        type: json['type'],
        url: json['url']);
  }
}
