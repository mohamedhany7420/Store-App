import 'dart:developer';

import 'package:dio/dio.dart';

class GetAllCategories {
  final Dio dio;

  GetAllCategories(this.dio);
  Future<List<dynamic>> getAllCategories() async{
    var response = await dio.get('https://fakestoreapi.com/products/categories');
    List<dynamic> categoriesList = response.data;
    log(response.data.toString());
    return categoriesList;
  }
}