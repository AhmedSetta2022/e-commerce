import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:persistent_shopping_cart/model/cart_model.dart';
import 'package:persistent_shopping_cart/persistent_shopping_cart.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  static String id = "CartPage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                PersistentShoppingCart().clearCart();
              },
              icon: const Icon(
                Icons.delete_forever,
                color: Colors.red,
                size: 36,
              ))
        ],
        backgroundColor: Colors.grey[300],
        title: const Text(
          "C A R T ",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: PersistentShoppingCart().showCartItems(
                cartTileWidget: ({required PersistentShoppingCartItem data}) =>
                    Card(
                  color: Colors.white,
                  elevation: 10,
                  child: Row(
                    children: [
                      Image.network(
                        data.productThumbnail.toString(),
                        width: 100,
                        height: 100,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data.productName.substring(0, 11),
                              style: TextStyle(
                                  color: Colors.blue[400],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              data.productDescription.toString(),
                              maxLines: 2,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(children: [
                              Text(
                                "\$ ${data.unitPrice.toString()}",
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              IconButton(
                                  onPressed: () async {
                                    await PersistentShoppingCart()
                                        .removeFromCart(data.productId);
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                    size: 30,
                                  )),
                            ])
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          IconButton(
                            onPressed: () async {
                              await PersistentShoppingCart()
                                  .incrementCartItemQuantity(data.productId);
                            },
                            icon: const Icon(
                              Icons.add,
                              size: 30,
                              color: Colors.green,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(7),
                            decoration: const BoxDecoration(
                                color: Colors.grey, shape: BoxShape.circle),
                            child: Text(
                              data.quantity.toString(),
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          IconButton(
                            onPressed: () async {
                              await PersistentShoppingCart()
                                  .decrementCartItemQuantity(data.productId);
                            },
                            icon: const Icon(
                              Icons.remove,
                              size: 30,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                showEmptyCartMsgWidget: Center(
                  child: Lottie.asset("images/empty_cart.json", animate: true),
                ),
              ),
            ),
            PersistentShoppingCart().showTotalAmountWidget(
              cartTotalAmountWidgetBuilder: (double totalAmount) {
                return Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Visibility(
                          visible: totalAmount == 0.0 ? false : true,
                          child: Text(
                            totalAmount.toString(),
                            style: TextStyle(
                                color: Colors.blue[700],
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          )),
                      GestureDetector(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(12)),
                              child: const Center(
                                child: Text(
                                  "Check Out..",
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          )),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
