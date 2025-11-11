import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../models/products_model.dart';
import '../services/get_all_product_service.dart';
import '../widgets/card_wedgit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static String id = "homePage";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<ProductsModel>> productsFuture;

  @override
  void initState() {
    super.initState();
    productsFuture = AllProductService(Dio()).getallproduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Trend"),
        centerTitle: true,
        leading: BackButton(),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.shopping_cart_rounded),
            ),
          )
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
          child: FutureBuilder<List<ProductsModel>>(
            future: productsFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: ShimmerLoading());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('No products found'));
              } else {
                final products = snapshot.data!;
                return GridView.builder(
                  padding: const EdgeInsets.all(12),
                  itemCount: products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 0,
                    childAspectRatio: 0.80,
                  ),
                  itemBuilder: (context, index) {
                    return CardWedgit(productsModel: products[index]);
                  },
                );
              }
            },
          )),
    );
  }
}

class ShimmerLoading extends StatelessWidget {
  const ShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 6,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            height: 100,
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            color: Colors.white,
          ),
        );
      },
    );
  }
}
