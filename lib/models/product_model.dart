class ProductModel {
  final int id;
  final String title;
  final String description;
  final String image;
  final RatingModel? rating;
  final String category;
  final dynamic price;

  ProductModel(
      {required this.id,
      required this.title,
      required this.category,
      required this.price,
      required this.description,
      required this.image,
      required this.rating});
  factory ProductModel.fromJson(jsonData) {
    return ProductModel(
      id: jsonData['id'],
      title: jsonData['title'],
      category: jsonData['category'],
      price: jsonData['price'],
      description: jsonData['description'],
      image: jsonData['image'],
      rating: jsonData['rating'] == null
            ? null
            : RatingModel.fromJson(jsonData['rating']));
  }
}

//info: rating model
class RatingModel {
  final num rate;
  final num count;

  RatingModel({required this.rate, required this.count});
  factory RatingModel.fromJson(jsonData) {
    return RatingModel(rate: jsonData['rate'], count: jsonData['count']);
  }
}
