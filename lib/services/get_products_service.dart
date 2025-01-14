import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:store_app/models/product_model.dart';

class GetProductsService{
  final Dio dio;
  GetProductsService( this.dio);

  Future<List<ProductModel>> getProducts() async{
    var response= await dio.get('https://fakestoreapi.com/products');
    log(response.data[10]['rating'].toString());
    List<ProductModel> productsList = [];
    for (int i = 0; i < response.data.length; i++) {
      productsList.add(
        ProductModel.fromJson(response.data[i])
      );
    }
    log(productsList.toString());
    return productsList;
  }
}