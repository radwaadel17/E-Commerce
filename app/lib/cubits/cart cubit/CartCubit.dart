import 'package:app/cubits/cart%20cubit/states.dart';
import 'package:app/cubits/fav%20cubit/favStates.dart';
import 'package:app/models/product%20model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(InitialState());
  double sum = 0;
  final List<ProductModel> data = [];
  final List<double> Prices = [];
  addToCart(ProductModel model) {
    data.add(model);
    emit(AddToCartStates(List.from(data)));
  }

  removeFromcart(ProductModel model) {
    data.remove(model);
    emit(RemoveFromCartState(List.from(data)));
  }
}
