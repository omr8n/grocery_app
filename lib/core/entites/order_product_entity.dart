// class OrderProductEntity {
//   final String name;
//   final String imageUrl;
//   final double price;
//   final int quantity;

//   const OrderProductEntity({
//     required this.name,
//     required this.imageUrl,
//     required this.price,
//     required this.quantity,
//   });
// }

class OrderProductEntity {
  final String name;
  final String imageUrl;
  final double price;
  final int quantity;
  final double? onSale;
  // السعر عند الخصم
  final bool? isOnSale;
  const OrderProductEntity({
    this.onSale,
    this.isOnSale,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.quantity,
  });
}
