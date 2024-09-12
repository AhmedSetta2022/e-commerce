// ignore_for_file: missing_required_param

import 'package:e_commerce/helper/api.dart';
import 'package:e_commerce/models/product_model.dart';

class UpdateProduct {
  Future<ProductModel> updateProduct(
      {required String title,
      required String price,
      required String desc,
      required String img,
      required String category}) async {
    Map<String, dynamic> data = await Api()
        .postRequest(url: "https://fakestoreapi.com/products", body: {
      "title": title,
      "price": price,
      "description": desc,
      "image": img,
      "category": category,
    });

    return ProductModel.fromJson(data);
  }
}
