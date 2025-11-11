import 'package:dio/dio.dart';
import 'package:store_app/services/helper/api.dart';

class AllCategoriesService {
  Dio dio;
  AllCategoriesService(this.dio);

  Future<List<dynamic>> getAllCategories() async {
    List<dynamic> mydata =
        await Api().get(url: "https://fakestoreapi.com/products/categories");

    return mydata;
  }
}
