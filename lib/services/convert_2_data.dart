class Product {
  final String id;
  final String brand;
  final String name;
  final int price;
  final String offer;
  final int rating;
  final List<String> images;

  Product({
    required this.id,
    required this.brand,
    required this.name,
    required this.price,
    required this.offer,
    required this.rating,
    required this.images,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['_id']?.toString() ?? '',
      brand: json['brand'] ?? 'Unknown',
      name: json['name'] ?? 'No name',
      price: json['price'] ?? 0,
      offer: json['offer'] ?? '0%',
      rating: json['rating'] ?? 0,
      images: json['images'] != null
          ? List<String>.from(json['images'])
          : [],
    );
  }



}
