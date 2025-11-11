import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:store_app/models/products_model.dart';
import 'package:store_app/services/put_update_product.dart';
import 'package:store_app/widgets/custom_text_feild.dart';

import '../widgets/custom_button.dart';

class UpdateProductPage extends StatelessWidget {
  UpdateProductPage({super.key});
  static String id = "updateProduct";
  String? productName, description, image;
  String? price;
  @override
  Widget build(BuildContext context) {
    ProductsModel productsModel =
        ModalRoute.of(context)!.settings.arguments as ProductsModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Update ${productsModel.title.split(' ').take(2).join(' ')}",
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 32),
        child: Column(
          children: [
            CustomTextField(
              hint: "Product Name",
              inputType: TextInputType.text,
              onchange: (data) {
                productName = data;
              },
            ),
            CustomTextField(
              hint: "Price",
              inputType: TextInputType.number,
              onchange: (data) {
                price = data;
              },
            ),
            CustomTextField(
                hint: "Description",
                inputType: TextInputType.text,
                onchange: (data) {
                  description = data;
                }),
            CustomTextField(
                hint: "Image",
                inputType: TextInputType.text,
                onchange: (data) {
                  image = data;
                }),
            SizedBox(
              height: 15,
            ),
            CustomButton(
              text: "Update",
              onPressed: () {
                UpdateProductService(Dio()).editProduct(
                    id: productsModel.id,
                    title: productName!,
                    price: price!,
                    description: description!,
                    image: image!,
                    category: productsModel.category);
              },
            ),
          ],
        ),
      ),
    );
  }
}
