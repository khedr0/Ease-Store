class ProductsModel {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final RatingModel rating;

  ProductsModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> jsonData) {
    return ProductsModel(
      id: jsonData['id'],
      title: jsonData['title'],
      price: (jsonData['price'] as num).toDouble(), // ← هنا التعديل
      description: jsonData['description'],
      category: jsonData['category'],
      image: jsonData['image'],
      rating: RatingModel.fromJson(jsonData['rating']),
    );
  }
}

class RatingModel {
  final double rate;
  final int count;

  RatingModel({
    required this.rate,
    required this.count,
  });

  factory RatingModel.fromJson(Map<String, dynamic> jsonData) {
    return RatingModel(
      rate: (jsonData['rate'] as num).toDouble(), // ← وهنا كمان
      count: jsonData['count'],
    );
  }
}
