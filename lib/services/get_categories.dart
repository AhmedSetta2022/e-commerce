// ignore_for_file: missing_required_param

import 'package:e_commerce/helper/api.dart';
import 'package:e_commerce/models/product_model.dart';

class GetCategoryService {
  Future<List<ProductModel>> getCategory(String categoryName) async {
    List<dynamic> data = await Api().getRequest(
        url: "https://fakestoreapi.com/products/category/$categoryName");
    List<ProductModel> categoryList = [];
    for (int i = 0; i < data.length; i++) {
      categoryList.add(ProductModel.fromJson(data[i]));
    }
    return categoryList;
  }
}
