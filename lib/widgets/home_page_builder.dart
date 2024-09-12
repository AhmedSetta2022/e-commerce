import 'package:e_commerce/models/product_model.dart';

import 'package:e_commerce/services/all_products.dart';
import 'package:e_commerce/widgets/custom_card.dart';
import 'package:flutter/material.dart';

class HomePageBuilder extends StatelessWidget {
  const HomePageBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 65),
        child: FutureBuilder<List<ProductModel>>(
          future: AllProducts().getAllProducts(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
              );
            } else {
              List<ProductModel> products = snapshot.data!;
              return GridView.builder(
                  itemCount: products.length,
                  clipBehavior: Clip.none,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.4,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 100,
                  ),
                  itemBuilder: (context, index) {
                    return CustomProductCard(
                      product: products[index],
                    );
                  });
            }
          },
        ));
  }
}
