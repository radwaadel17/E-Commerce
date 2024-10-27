import 'package:app/models/product%20model.dart';
import 'package:app/services/Get%20all%20products.dart';
import 'package:app/services/Get%20category.dart';
import 'package:app/widgets/Home%20page%20grid.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePageBuilder extends StatefulWidget {
  const HomePageBuilder({super.key, required this.nameCategory});
  final String nameCategory;
  @override
  State<HomePageBuilder> createState() => _HomePageBuilderState();
}

class _HomePageBuilderState extends State<HomePageBuilder> {
  var futureData;

  @override
  void didUpdateWidget(HomePageBuilder oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    if (oldWidget.nameCategory != widget.nameCategory) {
      fetchData();
      setState(() {});
    }
  }

  void fetchData() {
    if (widget.nameCategory == 'All') {
      futureData = getAllproducts(Dio()).GetAllproductsaync();
    } else {
      futureData = getCategory(Dio()).GetCategory(value: widget.nameCategory);
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    fetchData();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProductModel>>(
        future: futureData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomePageGrid(data: snapshot.data!);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
