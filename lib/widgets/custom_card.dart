// ignore_for_file: must_be_immutable

import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/screens/product_details.dart';
import 'package:flutter/material.dart';
import 'package:persistent_shopping_cart/model/cart_model.dart';
import 'package:persistent_shopping_cart/persistent_shopping_cart.dart';

class CustomProductCard extends StatelessWidget {
  CustomProductCard({super.key, required this.product});

  ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Stack(clipBehavior: Clip.none, children: [
      GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, ProductDetails.id, arguments: product);
        },
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                blurRadius: 50,
                color: Colors.grey.withOpacity(.2),
                spreadRadius: 0,
                offset: const Offset(1, 1))
          ]),
          height: 130,
          width: 230,
          child: Card(
            color: const Color(0xffFFFFFF),
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title.substring(0, 11),
                    style: const TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          " \$ ${product.price}",
                          style: const TextStyle(fontSize: 16),
                        ),
                        IconButton(
                            onPressed: () async {
                              await PersistentShoppingCart().addToCart(
                                  PersistentShoppingCartItem(
                                      productId: product.id.toString(),
                                      productName: product.title,
                                      unitPrice: product.price,
                                      productDescription: product.desc,
                                      productThumbnail: product.img,
                                      quantity: 1));
                            },
                            icon: const Icon(Icons.shopping_cart_outlined)),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      Positioned(
        right: 32,
        top: -60,
        child: Image.network(
          product.img,
          height: 100,
          width: 100,
        ),
      ),
    ]);
  }
}
