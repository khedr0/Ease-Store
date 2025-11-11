import 'package:dio/dio.dart';
import 'package:store_app/services/helper/api.dart';

import '../models/products_model.dart';

class AddProductService {
  Dio dio;
  AddProductService(this.dio);

  Future<ProductsModel> addProduct(
      {required String title,
      required String price,
      required String description,
      required String image,
      required String category}) async {
    Response response = await Api().post(
      url: "https://fakestoreapi.com/products",
      data: {
        "title": title,
        "price": price,
        "description": description,
        "image": image,
        "category": category,
      },
    );
    return response.data;
  }
}
