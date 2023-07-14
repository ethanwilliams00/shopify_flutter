import 'package:freezed_annotation/freezed_annotation.dart';

class MenuItem {
  MenuItem({
    required String id,
    required List<MenuItem> items,
    required String resourceId,
    required List<String> tags,
    required String title,
    required String type,
    required String url,
  });

  static MenuItem fromGraphJson(Map<String, dynamic> json) {
    List<MenuItem> menuItems = [];
    for (var item in (json['node'] ?? {'items': []})['items']) {
      menuItems.add(MenuItem.fromGraphJson(item));
    }
    List<String> tags = [];
    for (String item in (json['node'] ?? {'tags': []})['tags']) {
      tags.add(item);
    }
    return MenuItem(
        id: (json['node'] ?? {})['id'],
        items: menuItems,
        resourceId: (json['node'] ?? {})['resourceId'],
        tags: tags,
        title: (json['node'] ?? {})['title'],
        type: (json['node'] ?? {})['type'],
        url: (json['node'] ?? {})['url']);
  }
}
