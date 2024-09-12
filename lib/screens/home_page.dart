import 'package:e_commerce/screens/cart_page.dart';
import 'package:e_commerce/widgets/home_page_builder.dart';
import 'package:e_commerce/widgets/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:persistent_shopping_cart/persistent_shopping_cart.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static String id = "HomePage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        actions: [
          PersistentShoppingCart().showCartItemCountWidget(
            cartItemCountWidgetBuilder: (itemCount) => IconButton(
              onPressed: () {
                Navigator.pushNamed(context, CartPage.id);
              },
              icon: Badge(
                label: Text(itemCount.toString()),
                child: const Icon(Icons.shopping_bag_outlined),
              ),
            ),
          ),
          const SizedBox(width: 20.0)
        ],
        backgroundColor: Colors.grey[300],
        title: const Text("S H O P P Y"),
        centerTitle: true,
      ),
      drawer: const MyDrawer(),
      body: const HomePageBuilder(),
    );
  }
}
