class CartItem {
  final String name;
  final String brand;
  final String image;
  final int price;
  final String offer;
  final String size;
  final String color;
  int quantity;

  CartItem({
    required this.name,
    required this.brand,
    required this.image,
    required this.price,
    required this.offer,
    required this.size,
    required this.color,
    this.quantity = 1,
  });
}

List<CartItem> cartList = [];
List<CartItem> favList = [];

