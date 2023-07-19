import 'package:flutter/material.dart';
import 'package:shopify_flutter/models/src/cart/buyer_identity.dart';
import 'package:shopify_flutter/models/src/cart/cart.dart';
import 'package:shopify_flutter/models/src/cart/cart_cost.dart';
import 'package:shopify_flutter/models/src/product/price_v_2/price_v_2.dart';
import 'package:shopify_flutter/shopify_flutter.dart';

import 'screens/collection_tab.dart';
import 'screens/home_tab.dart';
import 'screens/profile_tab.dart';
import 'screens/search_tab.dart';

ShopifyUser? user;

void main() {
  ShopifyConfig.setConfig(
    storefrontAccessToken: "9a35a255b9ce8d7f4a178ebef627bde8",
    adminAccessToken: "shpat_*******************",
    storeUrl: 'inergysolar.myshopify.com',
    storefrontApiVersion: '2023-07',
  );
  ShopifyAuth.instance
      .signInWithEmailAndPassword(
        email: 'joshua.pachner@inergysolar.com',
        password: 'weloveethan',
      )
      .then((value) => user = value);
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
  String str = "";

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
                // var menu =
                //     await ShopifyStore.instance.getMenuByHandle('header');
                // var pages = await ShopifyPage.instance.getAllPages();
                // var products = await ShopifyStore.instance.getAllProducts();
                // if (kDebugMode) {
                //   print(
                //       'got menu: ${menu.toString() + pages.toString() + products.toString()}');
                // }
                var collections =
                    await ShopifyStore.instance.getAllCollections();
                var products = await ShopifyStore.instance
                    .getAllProductsFromCollectionById(collections[2].id);
                var cart = await ShopifyCart.instance.createCart(Cart(
                    buyerIdentity: BuyerIdentity(
                      countryCode: "",
                      customer: user!,
                      deliveryAddressPreferences: [],
                      email: user!.email!,
                      phone: '',
                      walletPreferences: [],
                    ),
                    checkoutUrl: "",
                    cost: CartCost(
                        checkoutChargeAmount:
                            PriceV2(amount: 0, currencyCode: "\$"),
                        subtotalAmount: PriceV2(amount: 0, currencyCode: "\$"),
                        subtotalAmountEstimated: false,
                        totalAmount: PriceV2(amount: 0, currencyCode: "\$"),
                        totalAmountEstimated: false,
                        totalDutyAmount: PriceV2(amount: 0, currencyCode: "\$"),
                        totalDutyAmountEstimated: false,
                        totalTaxAmount: PriceV2(amount: 0, currencyCode: "\$"),
                        totalTaxAmountEstimated: false),
                    createdAt: DateTime.now(),
                    discountAllocations: [],
                    discountCodes: [],
                    id: "",
                    note: "",
                    totalQuantity: 1,
                    updatedAt: DateTime.now(),
                    lines: [
                      LineItem(
                          title: products[0].title,
                          quantity: 1,
                          discountAllocations: [],
                          variantId: products[0].productVariants[0].id)
                    ]));
                setState(() {
                  str = products[0].description!;
                  str = cart.checkoutUrl;
                });
              },
              child: const Text("Test Query")),
          Text(str),
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
