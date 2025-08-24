import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:route_e_commerce_v2/core/l10n/translations/app_localizations.dart';
import 'package:route_e_commerce_v2/core/utils/app_assets.dart';
import 'package:route_e_commerce_v2/features/cart/domain/entities/cart_product_entity.dart';

class CartProductWidget extends StatelessWidget {
  final CartProduct cartProduct;
  final int colorIndex;

  const CartProductWidget({
    super.key,
    required this.cartProduct,
    required this.colorIndex,
  });

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      height: 112,
      decoration: BoxDecoration(
        border: Border.all(
          color: colorScheme.primary.withValues(alpha: .3),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: colorScheme.primary.withValues(alpha: .3),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: CachedNetworkImage(
                  imageUrl:
                      cartProduct.product?.imageCover ??
                      NetworkImages.noImageAvailable,
                  fit: BoxFit.cover,
                  placeholder:
                      (context, url) => const CircularProgressIndicator(),
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Text(
                      cartProduct.product?.title ?? '',
                      style: textTheme.headlineMedium,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                    ),
                  ),
                  Text(
                    cartProduct.product?.availableColors?[colorIndex] ?? '',
                    style: textTheme.bodySmall?.copyWith(
                      color: colorScheme.secondary.withValues(alpha: .6),
                    ),
                  ),
                  Text(
                    '${AppLocalizations.of(context)!.egp} ${cartProduct.price}',
                    style: textTheme.headlineMedium,
                  ),
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Iconsax.trash_outline),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: colorScheme.primary,
                  borderRadius: BorderRadius.circular(1000),
                ),
                child: Row(
                  spacing: 10,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        //TODO: Implement (-) product count
                      },
                      child: Icon(
                        Icons.remove_circle_outline,
                        color: colorScheme.onPrimary,
                        size: 30,
                      ),
                    ),
                    Text(
                      cartProduct.count.toString(),
                      style: textTheme.headlineMedium?.copyWith(
                        color: colorScheme.onPrimary,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        //TODO: Implement add product count
                      },
                      child: Icon(
                        Icons.add_circle_outline,
                        color: colorScheme.onPrimary,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
