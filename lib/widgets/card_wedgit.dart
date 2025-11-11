import 'package:flutter/material.dart';
import 'package:store_app/models/products_model.dart';
import 'package:store_app/screans/update_product_page.dart';

class CardWedgit extends StatelessWidget {
  ProductsModel productsModel;
  CardWedgit({super.key, required this.productsModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, UpdateProductPage.id,
            arguments: productsModel);
      },
      child: Stack(
        alignment: Alignment.topCenter,
        clipBehavior: Clip.none, // مهم علشان الصورة اللي بره الكارد متتقصش
        children: [
          // الكارد
          Container(
            margin: EdgeInsets.only(
                top: 70), // زود المسافة علشان يسيب نص الصورة جوه
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  blurRadius: 12,
                  spreadRadius: 0,
                  offset: Offset(0, 6),
                ),
              ],
            ),
            child: Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      productsModel.title,
                      maxLines: 1,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(r"$" "${productsModel.price}"),
                        Icon(Icons.favorite_rounded, color: Colors.red),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          // الصورة اللي نصها فوق ونصها جوه الكارد
          Transform.translate(
            offset: Offset(0, 20), // دي اللي بترفع الصورة لفوق
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(productsModel.image),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
