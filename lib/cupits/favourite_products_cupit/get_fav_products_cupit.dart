import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/models/product_model.dart';

class GetFavProductsCupit extends Cubit<List<ProductModel>> {
  GetFavProductsCupit() : super([]);

  void toggleFavorite(ProductModel product) {
    if (state.contains(product)) {
      emit(state.where((item) => item != product).toList());
    } else {
      emit([...state, product]);
    }
  }
}
