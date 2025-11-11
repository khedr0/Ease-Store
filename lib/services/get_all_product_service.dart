import 'package:dio/dio.dart';

import '../models/products_model.dart';
import 'helper/api.dart';

class AllProductService {
  final Dio dio;
  AllProductService(this.dio);

  Future<List<ProductsModel>> getallproduct() async {
    var response = await Api().get(url: "https://fakestoreapi.com/products");
    List<dynamic> myData = response;
    List<ProductsModel> products = [];
    for (int i = 0; i < myData.length; i++) {
      products.add(ProductsModel.fromJson(myData[i]));
    }
    return products;
  }
}
