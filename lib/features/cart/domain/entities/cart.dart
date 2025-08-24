import 'cart_product_entity.dart';

class Cart {
  final String? id;
  final String? cartOwner;
  final List<CartProduct>? products;
  final String? createdAt;
  final String? updatedAt;
  final int? version;
  final int? totalCartPrice;

  Cart({
    this.id,
    this.cartOwner,
    this.products,
    this.createdAt,
    this.updatedAt,
    this.version,
    this.totalCartPrice,
  });
}
