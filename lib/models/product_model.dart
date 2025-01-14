class ProductModel {
 final dynamic id;
 final String title;
 final dynamic price;
 final String description;
 final String image;
 final String category;
 final RatingModel rating;
  ProductModel({
    required this.id, required this.title, required this.price, required this.description, required this.image, required this.category,
    required this.rating
  });

  factory ProductModel.fromJson(json){
    return ProductModel(
        id: json['id'],
        title: json["title"],
        price: json['price'],
        description: json["description"],
        image: json['image'],
        category: json["category"],
        rating: RatingModel.fromJson(json['rating'])
    );
  }
}
class RatingModel {
  final dynamic rate;
  final dynamic count;

  RatingModel({required this.rate, required this.count});
  factory RatingModel.fromJson(json){
    return RatingModel(
        rate: json['rate'],
        count: json['count']
    );
  }
}