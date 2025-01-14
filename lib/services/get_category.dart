import 'dart:developer';

import 'package:dio/dio.dart';

import '../models/product_model.dart';

class GetCategory {
  final Dio dio;

  GetCategory(this.dio);

  Future<List<ProductModel>> getCategory({required String categoryName}) async{
    var response= await dio.get('https://fakestoreapi.com/products/category/$categoryName');
    log(response.data[2]['rating'].toString());
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