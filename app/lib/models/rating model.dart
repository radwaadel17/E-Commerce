class RatingModel {
  final dynamic? rate ; 
  final int? count ;
  RatingModel({required this.count ,required this.rate});
  factory RatingModel.fromJson (jsonData) {
    return RatingModel(
     count: jsonData['count'],
     rate: jsonData['rate'],
    );
  }
}