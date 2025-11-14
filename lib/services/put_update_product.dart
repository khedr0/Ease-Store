import 'package:dio/dio.dart';

import '../models/products_model.dart';
import 'helper/api.dart';

class UpdateProductService {
  Dio dio;
  UpdateProductService(this.dio);

  Future<ProductsModel> editProduct(
      {required int id,
      required String title,
      required String price,
      required String description,
      required String image,
      required String category}) async {
    print("IDDDDDDDDDDD : $id");
    Response response = await Api().put(
      url: "https://fakestoreapi.com/products/$id",
      id: id,
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
