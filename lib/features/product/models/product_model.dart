class ProductModel {
  final String id;
  final String title;
  final String imageUrl;
  final int price; // به تومان
  final String category;
  final int stock;
  final String shortDescription;

  ProductModel({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.price,
    required this.category,
    required this.stock,
    required this.shortDescription,
  });
}
