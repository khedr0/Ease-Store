import 'package:dio/dio.dart';
import 'package:store_app/services/helper/api.dart';

import '../models/products_model.dart';

class ProductViaCategoryService {
  Dio dio;
  ProductViaCategoryService({required this.dio});

  Future<List<ProductsModel>> getProductsByCategory(
      {required String categoryName}) async {
    Response response = await Api()
        .get(url: "https://fakestoreapi.com/products/category/$categoryName");
    List<dynamic> mydata = response.data;
    List<ProductsModel> productsViaCategory = [];
    for (int i = 0; i < mydata.length; i++) {
      productsViaCategory.add(ProductsModel.fromJson(mydata[i]));
    }
    return productsViaCategory;
  }
}
