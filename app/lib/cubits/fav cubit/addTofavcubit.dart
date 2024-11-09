import 'package:app/cubits/fav%20cubit/favStates.dart';
import 'package:app/models/product%20model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class AddToFavCubit extends Cubit<Favstates>{
  AddToFavCubit() :super(IntialState());
  List<ProductModel>favs  = [];
  favMethod(ProductModel model){
  favs.add(model);
  emit(AddTofav(List.from(favs)));
  }
  remove(ProductModel model){
    favs.remove(model);
    emit(removeFromFav(List.from(favs)));
  }
}