import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/get_products_service.dart';
import 'package:store_app/widgets/custom_card_widget.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen({super.key});
  static String id = 'AllProductsScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(
          top : 80,
          left: 30,
        ),
        child: FutureBuilder<List<ProductModel>>
          (
            future: GetProductsService(Dio()).getProducts(),
            builder: (context, snapshot) {
              if(snapshot.hasData){
                List<ProductModel> products= snapshot.data!;
                return GridView.builder(
                  itemCount: products.length,
                  clipBehavior: Clip.none,
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return CustomCardWidget(productModel: products[index],);
                  },
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
        )
      ),
    );
  }
}
