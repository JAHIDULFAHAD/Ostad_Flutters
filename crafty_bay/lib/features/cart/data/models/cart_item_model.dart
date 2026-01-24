class CartItemModel {
  final String id;
  final String title;
  final int price;
  final int quantity;
  final String image;
  final String? color;
  final String? size;

  CartItemModel({
    required this.id,
    required this.title,
    required this.price,
    required this.quantity,
    required this.image,
    this.color,
    this.size,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    final product = json['product'] ?? {};

    final List photos = (product['photos'] ?? []) as List;

    return CartItemModel(
      id: (json['_id'] ?? '').toString(),
      title: (product['title'] ?? '').toString(),

      price: (product['current_price'] ?? 0) as int,

      quantity: (json['quantity'] ?? 1) as int,

      image: photos.isNotEmpty ? photos.first.toString() : '',

      color: json['color']?.toString(),
      size: json['size']?.toString(),
    );
  }
}
