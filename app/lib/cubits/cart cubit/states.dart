import 'package:app/models/product%20model.dart';

class CartState{}
class InitialState extends CartState{}
class AddToCartStates extends CartState{
  List<ProductModel> CartData ;
  AddToCartStates(this.CartData);
}
class RemoveFromCartState extends CartState{
  List<ProductModel> CartData ;
  RemoveFromCartState(this.CartData);
}
