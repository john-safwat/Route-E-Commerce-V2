import 'package:flutter/material.dart';
import 'package:route_e_commerce_v2/core/utils/dummy_data_provider.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/favorite/domain/entities/wishlist_entity.dart';

import '../widgets/wishlist_product_widget.dart';

class FavoriteTabView extends StatelessWidget {
  const FavoriteTabView({super.key});

  @override
  Widget build(BuildContext context) {
    Wishlist wishlistProducts = DummyDataProvider.generateWishlistProducts();
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.all(16),
            itemBuilder: (context, index) {
              return WishlistProductWidget(
                product: wishlistProducts.products?[index],
                colorIndex:
                    index %
                    wishlistProducts.products![index].availableColors!.length,
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemCount: wishlistProducts.count ?? 0,
          ),
        ),
      ],
    );
  }
}
