import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cupits/favourite_products_cupit/get_fav_products_cupit.dart';
import 'package:store_app/models/product_model.dart';

class CustomCardWidget extends StatelessWidget {
  CustomCardWidget({super.key, required this.productModel});
ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Stack(

      clipBehavior: Clip.none,
      children: [
        SizedBox
          (
          height: 120,
          width: 160,
          child: Card(
            color: Colors.white,
            elevation: 12,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5)
            ),
            shadowColor: Colors.grey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(productModel.title.substring(0 , 6),
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        r'$' '${productModel.price.toString()}',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                   BlocBuilder<GetFavProductsCupit, List<ProductModel>>(
                       builder: (context, favorites) {
                         bool isFavorite = favorites.contains(productModel);
                         return GestureDetector(
                           onTap: () {
                             context.read<GetFavProductsCupit>().toggleFavorite(productModel);                           },
                           child: Icon(
                             Icons.favorite,
                             color: isFavorite ? Colors.red : Colors.grey,
                             size: 18,
                           ),
                         );
                       },
                   )
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: -30,
          left: 40,
          right: 40,
          child: Image.network(
            productModel.image,
            width: 60,
            height: 70,

          ),
        )
      ],
    );
  }
}
