import 'cart.dart';

class CartEntity {
  final String? status;
  final int? numOfCartItems;
  final String? cartId;
  final Cart? data;

  CartEntity({this.status, this.numOfCartItems, this.cartId, this.data});
}
