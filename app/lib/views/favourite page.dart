import 'package:app/cubits/fav%20cubit/addTofavcubit.dart';
import 'package:app/cubits/fav%20cubit/favStates.dart';
import 'package:app/helper/Constants.dart';
import 'package:app/models/product%20model.dart';
import 'package:app/widgets/ProductCard.dart';
import 'package:app/widgets/FavouriteCard.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Favourite extends StatefulWidget {
  const Favourite({super.key});

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    int crossAxisCount;
    if (width < 600) {
      crossAxisCount = 2;
    } else if (width < 1200) {
      crossAxisCount = 3;
    } else {
      crossAxisCount = 4;
    }
    double itemWidth = width / crossAxisCount;
    return Scaffold(
      backgroundColor: Kcolor,
     
      body: BlocBuilder<AddToFavCubit, Favstates>(
        builder: (context, state) {
          if (state is AddTofav) {
            return Padding(
              padding:EdgeInsets.symmetric(horizontal: 30.w),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  childAspectRatio: (itemWidth.w / (itemWidth.w * 1.7)),
                ),
                itemBuilder: (context, index) {
                  return FavProductCard(model: state.favProducts[index]);
                },
                itemCount: state.favProducts.length,
              ),
            );
          } else if (state is removeFromFav){
            
            return Padding(
              padding:EdgeInsets.symmetric(horizontal: 30.w),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  childAspectRatio: (itemWidth.w / (itemWidth.w * 1.7)),
                ),
                itemBuilder: (context, index) {
                  return FavProductCard(model: state.favProducts[index]);
                },
                itemCount: state.favProducts.length,
              ),
            );
          }
          else {
           return const Center(child: Text('No favorites added yet.'));
          }
        },
      ),
    );
  }
}
