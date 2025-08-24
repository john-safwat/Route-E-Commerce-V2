import 'package:route_e_commerce_v2/features/cart/domain/entities/cart_entity.dart';

import 'cart_dto.dart';

class CartResponseDto {
  String? status;
  int? numOfCartItems;
  String? cartId;
  CartDto? data;

  CartResponseDto({this.status, this.numOfCartItems, this.cartId, this.data});

  CartResponseDto.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    numOfCartItems = json['numOfCartItems'];
    cartId = json['cartId'];
    data = json['data'] != null ? CartDto.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['numOfCartItems'] = numOfCartItems;
    data['cartId'] = cartId;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }

  CartEntity toEntity() {
    return CartEntity(
      cartId: cartId,
      data: data?.toEntity(),
      numOfCartItems: numOfCartItems,
      status: status,
    );
  }
}
