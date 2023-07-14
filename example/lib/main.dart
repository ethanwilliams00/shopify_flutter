import 'package:flutter/material.dart';
import 'package:shopify_flutter/shopify/src/shopify_page.dart';
import 'package:shopify_flutter/shopify_flutter.dart';

import 'screens/collection_tab.dart';
import 'screens/home_tab.dart';
import 'screens/profile_tab.dart';
import 'screens/search_tab.dart';

void main() {
  ShopifyConfig.setConfig(
    storefrontAccessToken: "9a35a255b9ce8d7f4a178ebef627bde8",
    adminAccessToken: "shpat_*******************",
    storeUrl: 'inergysolar.myshopify.com',
    storefrontApiVersion: '2023-07',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopify Example',
      theme: ThemeData(primaryColor: Colors.redAccent),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  List<Widget> tabs = [
    const HomeTab(),
    const CollectionTab(),
    const SearchTab(),
    const ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          ElevatedButton(
              onPressed: () async {
                var menu =
                    await ShopifyStore.instance.getMenuByHandle('header');
                var pages = await ShopifyPage.instance.getAllPages();
                var products = await ShopifyStore.instance.getAllProducts();
                print('got menu');
              },
              child: const Text("Test Query")),
          // IndexedStack(
          //   index: _currentIndex,
          //   children: tabs,
          // ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onNavigationBarItemClick,
        fixedColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Collections'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  void _onNavigationBarItemClick(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
