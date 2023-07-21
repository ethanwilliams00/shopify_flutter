import 'package:shopify_flutter/models/src/menu/menu_item.dart';

class Menu {
  String handle;
  String id;
  List<MenuItem> items;
  int itemsCount;
  String title;
  Menu({
    required this.handle,
    required this.id,
    required this.items,
    required this.itemsCount,
    required this.title,
  });

  static Menu fromGraphJson(Map<String, dynamic> json) {
    List<MenuItem> menuItems = [];
    for (var item in json['items']) {
      menuItems.add(MenuItem.fromGraphJson(item));
    }
    return Menu(
      handle: json['handle'],
      id: json['id'],
      items: menuItems,
      itemsCount: json['itemsCount'] ?? 0,
      title: json['title'],
    );
  }
}
