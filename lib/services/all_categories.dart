// ignore_for_file: missing_required_param

import 'package:e_commerce/helper/api.dart';

class AllCategories {
  Future<List<dynamic>> getAllCategoires() async {
    List<dynamic> data = await Api()
        .getRequest(url: "https://fakestoreapi.com/products/categories");
    return data;
  }
}
