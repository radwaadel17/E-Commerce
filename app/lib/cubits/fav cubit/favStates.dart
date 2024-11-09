import 'package:app/models/product%20model.dart';

class Favstates {}
class IntialState extends Favstates{}
class AddTofav extends Favstates{
    List<ProductModel> favProducts ;
    AddTofav(this.favProducts);
}
class removeFromFav extends Favstates{
  List<ProductModel> favProducts ;
  removeFromFav(this.favProducts);
}