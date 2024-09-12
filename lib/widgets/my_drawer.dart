import 'package:e_commerce/screens/cart_page.dart';
import 'package:e_commerce/screens/profile_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey[300],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const DrawerHeader(
                  child: Icon(
                Icons.add_shopping_cart_sharp,
                size: 43,
                color: Colors.green,
              )),
              const SizedBox(
                height: 14,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: ListTile(
                  title: const Text("H O M E"),
                  leading: const Icon(Icons.home),
                  onTap: () => Navigator.pop(context),
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: ListTile(
                  title: const Text("C A R T"),
                  leading: const Icon(Icons.shopping_cart),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, CartPage.id);
                  },
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: ListTile(
                  title: const Text("P R O F I L E"),
                  leading: const Icon(Icons.person_2),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, ProfilePage.id);
                  },
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, bottom: 30),
            child: ListTile(
              iconColor: Colors.red,
              title: const Text("Log Out"),
              leading: const Icon(Icons.logout),
              onTap: () async => await FirebaseAuth.instance.signOut(),
            ),
          ),
        ],
      ),
    );
  }
}
