import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/models/products_model.dart';
import 'package:store_app/services/put_update_product.dart';
import 'package:store_app/widgets/custom_text_feild.dart';

import '../widgets/custom_button.dart';

class UpdateProductPage extends StatefulWidget {
  const UpdateProductPage({super.key});
  static String id = "updateProduct";

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName, description, image;

  bool isLoading = false;
  String? price;

  @override
  Widget build(BuildContext context) {
    ProductsModel productsModel =
        ModalRoute.of(context)!.settings.arguments as ProductsModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Update ${productsModel.title.split(' ').take(2).join(' ')}",
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 32),
          child: SingleChildScrollView(
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
                  onPressed: () async {
                    isLoading = true;
                    setState(() {});
                    try {
                      await updateProduct(productsModel);
                    } catch (e) {
                      isLoading = false;
                      setState(() {});
                    }
                    isLoading = false;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductsModel productsModel) async {
    await UpdateProductService(Dio()).editProduct(
        id: productsModel.id,
        title: productName == null ? productsModel.title : productName!,
        price: price == null ? productsModel.price.toString() : price!,
        description:
            description == null ? productsModel.description : description!,
        image: image == null ? productsModel.image : image!,
        category: productsModel.category);
  }
}
