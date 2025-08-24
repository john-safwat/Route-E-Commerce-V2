import 'package:flutter/material.dart';
import 'package:route_e_commerce_v2/core/utils/dummy_data_provider.dart';
import 'package:route_e_commerce_v2/features/cart/domain/entities/cart.dart';
import 'package:route_e_commerce_v2/features/cart/presentation/widgets/checkout_section.dart';

import '../widgets/cart_product_widget.dart';
import '../widgets/cart_screen_appbar.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Cart cart = DummyDataProvider.generateProductsInCart();

    return Scaffold(
      appBar: const CartScreenAppbar(),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemBuilder: (context, index) {
                return CartProductWidget(
                  cartProduct: cart.products![index],
                  colorIndex:
                      index %
                      cart.products![index].product!.availableColors!.length,
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemCount: cart.products!.length,
            ),
          ),
          CheckoutSection(totalCartPrice: cart.totalCartPrice ?? 0),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
