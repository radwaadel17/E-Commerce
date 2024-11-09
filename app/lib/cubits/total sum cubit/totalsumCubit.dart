import 'package:app/cubits/total%20sum%20cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Totalsumcubit extends Cubit<MainSatate>{
Totalsumcubit() :super(States());
Map<int , dynamic> total = {0 : 0};
double sum = 0 ;
void calc(){
   sum = 0 ;
   total.forEach((key , value){
       sum+=value;
   });
   emit(SumState(sum));
}
void addItem(int index  , dynamic price){
  total[index] = price;
  calc();
}
void removeItem(int index){
  total.remove(index);
  calc();
}
}