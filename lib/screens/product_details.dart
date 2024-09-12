// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/screens/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:persistent_shopping_cart/model/cart_model.dart';
import 'package:persistent_shopping_cart/persistent_shopping_cart.dart';

class ProductDetails extends StatefulWidget {
  ProductDetails({super.key});
  static String id = "DetalisPage";

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  bool isShowMore = true;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return Scaffold(
      appBar: AppBar(
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
        ],
        backgroundColor: Colors.grey[300],
        title: const Text(
          "D E T A I L S",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: Image.network(
                  product.img,
                  height: 270,
                  width: 200,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "\$ ${product.price}",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.purple[300],
                        borderRadius: BorderRadius.circular(6)),
                    child: const Text(
                      "New",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        size: 26,
                        color: Colors.yellow[700],
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Icon(
                        Icons.star,
                        size: 26,
                        color: Colors.yellow[700],
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Icon(
                        Icons.star,
                        size: 26,
                        color: Colors.yellow[700],
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Icon(
                        Icons.star,
                        size: 26,
                        color: Colors.yellow[700],
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Icon(
                        Icons.star,
                        size: 26,
                        color: Colors.yellow[700],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 26),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.edit_location,
                              size: 23,
                              color: Colors.black,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "S H O P P Y ",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.blue[500]),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                product.desc,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
                maxLines: isShowMore ? 2 : null,
                overflow: TextOverflow.fade,
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    isShowMore = !isShowMore;
                  });
                },
                child: isShowMore
                    ? const Text(
                        "Show More",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      )
                    : const Text(
                        "Show Less",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      ),
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () async {
                  await PersistentShoppingCart().addToCart(
                      PersistentShoppingCartItem(
                          productId: product.id.toString(),
                          productName: product.title,
                          unitPrice: product.price,
                          productDescription: product.desc,
                          productThumbnail: product.img,
                          quantity: 1));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 200,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Add to Cart :",
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.green),
                          ),
                          Icon(
                            Icons.shopping_cart_outlined,
                            size: 27,
                            color: Colors.green[700],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
