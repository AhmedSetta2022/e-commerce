import 'package:e_commerce/auth/auth_gate.dart';
import 'package:e_commerce/auth/login_or_register.dart';
import 'package:e_commerce/screens/cart_page.dart';
import 'package:e_commerce/screens/home_page.dart';
import 'package:e_commerce/screens/login.dart';
import 'package:e_commerce/screens/product_details.dart';
import 'package:e_commerce/screens/profile_page.dart';
import 'package:e_commerce/screens/register.dart';

import 'package:flutter/material.dart';

class AppRouter {
  static Map<String, Widget Function(BuildContext)> routes = {
    HomePage.id: (_) => const HomePage(),
    LoginPage.id: (_) => LoginPage(),
    RegisterPage.id: (_) => RegisterPage(),
    LoginOrRegister.id: (_) => const LoginOrRegister(),
    AuthGate.id: (_) => const AuthGate(),
    CartPage.id: (_) => const CartPage(),
    ProductDetails.id: (_) => ProductDetails(),
    ProfilePage.id: (_) => ProfilePage(),
  };
}
