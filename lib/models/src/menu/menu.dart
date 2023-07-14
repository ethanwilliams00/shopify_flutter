import 'package:shopify_flutter/models/src/menu/menu_item.dart';

class Menu {
  Menu({
    required String handle,
    required String id,
    required List<MenuItem> items,
    required int itemsCount,
    required String title,
  });

  static Menu fromGraphJson(Map<String, dynamic> json) {
    List<MenuItem> menuItems = [];
    for (var item in (json['node'] ?? {'items': []})['items']) {
      menuItems.add(MenuItem.fromGraphJson(item));
    }
    return Menu(
      handle: (json['node'] ?? {'handle': ''})['handle'],
      id: (json['node'] ?? {'id': ''})['id'],
      items: menuItems,
      itemsCount: (json['node'] ?? {'itemCount': 0})['itemsCount'] ?? 0,
      title: (json['node'] ?? {'title': ''})['title'],
    );
  }
}
