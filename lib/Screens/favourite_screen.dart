import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cupits/favourite_products_cupit/get_fav_products_cupit.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/widgets/custom_card_widget.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});
  static String id = 'FavoritesScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<GetFavProductsCupit, List<ProductModel>>(
        builder: (context, favorites) {
          if (favorites.isEmpty) {
            return const Center(
              child: Text(
                'No favorite products yet!',
                style: TextStyle(
                  fontSize: 32,
                ),
              ),
            );
          }
          return Center(
            child: ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final product = favorites[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30.0),
                  child: Center(child: CustomCardWidget(productModel: product)),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
