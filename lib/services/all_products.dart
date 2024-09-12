// ignore_for_file: missing_required_param

import 'package:e_commerce/helper/api.dart';
import 'package:e_commerce/models/product_model.dart';

class AllProducts {
  Future<List<ProductModel>> getAllProducts() async {
    List<dynamic> data =
        await Api().getRequest(url: "https://fakestoreapi.com/products");
    List<ProductModel> productsList = [];
    for (int i = 0; i < data.length; i++) {
      productsList.add(ProductModel.fromJson(data[i]));
    
    }
    return productsList;
  }
}
