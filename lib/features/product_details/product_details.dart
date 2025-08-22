import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:readmore/readmore.dart';
import 'package:route_e_commerce_v2/core/l10n/translations/app_localizations.dart';
import 'package:route_e_commerce_v2/core/theme/app_colors.dart';
import 'package:route_e_commerce_v2/core/theme/app_theme.dart';
import 'package:route_e_commerce_v2/core/utils/app_assets.dart';
import 'package:route_e_commerce_v2/features/product_details/widgets/color_selector.dart';
import 'package:route_e_commerce_v2/features/product_details/widgets/product_slider.dart';
import 'package:route_e_commerce_v2/features/product_details/widgets/size_selector.dart';
import 'package:route_e_commerce_v2/features/products/domain/entity/product.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final ValueNotifier<int> productCounter = ValueNotifier<int>(0);
  final ValueNotifier<int> selectedColor = ValueNotifier<int>(0);
  final ValueNotifier<int> selectedSize = ValueNotifier<int>(0);

  List<int> sizes = [35, 38, 39, 40];

  @override
  Widget build(BuildContext context) {
    var product = ModalRoute.of(context)!.settings.arguments as Product;
    AppLocalizations localizations = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        actionsPadding: const EdgeInsets.only(right: 16),
        title: Text(
          localizations.productDetails,
          style: AppTheme.getLightThemeData().textTheme.headlineMedium,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              //TODO: Implement search functionality
            },
            icon: SvgPicture.asset(AppSvgs.searchIcon),
          ),
          IconButton(
            onPressed: () {
              //TODO: Implement cart functionality
            },
            icon: SvgPicture.asset(AppSvgs.cartIcon),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 18, right: 18, bottom: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductSlider(initialIndex: 0, items: product.images!),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      product.title!,
                      style:
                          AppTheme.getLightThemeData().textTheme.headlineMedium,
                    ),
                  ),
                  Text(
                    "EGP ${_formatCommaNumber(product.price!)}",
                    style:
                        AppTheme.getLightThemeData().textTheme.headlineMedium,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.blue.withOpacity(.3),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: Text(
                      '3,230 Sold',
                      style: AppTheme.getLightThemeData().textTheme.bodyMedium
                          ?.copyWith(
                            color: AppColors.darkBlue,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  SvgPicture.asset(AppSvgs.starIcon),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      '${product.ratingsAverage!.toStringAsFixed(1)} (${_formatCommaNumber(product.ratingsQuantity!)})',
                      overflow: TextOverflow.ellipsis,
                      style: AppTheme.getLightThemeData().textTheme.titleSmall
                          ?.copyWith(
                            color: AppColors.darkBlue,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                  _productCount(product),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                localizations.description,
                style: AppTheme.getLightThemeData().textTheme.headlineMedium,
              ),
              const SizedBox(height: 8),
              ReadMoreText(
                product.description ?? '',
                style: AppTheme.getLightThemeData().textTheme.bodyMedium
                    ?.copyWith(
                      color: AppColors.blue.withValues(alpha: .9),
                      fontWeight: FontWeight.w400,
                    ),
                trimExpandedText: localizations.readLess,
                trimCollapsedText: localizations.readMore,
                moreStyle: AppTheme.getLightThemeData().textTheme.bodyMedium
                    ?.copyWith(
                      color: AppColors.darkBlue,
                      fontWeight: FontWeight.w600,
                    ),
                lessStyle: AppTheme.getLightThemeData().textTheme.bodyMedium
                    ?.copyWith(
                      color: AppColors.darkBlue,
                      fontWeight: FontWeight.w600,
                    ),
                trimLines: 3,
                trimMode: TrimMode.Line,
                colorClickableText: AppColors.blue,
              ),
              const SizedBox(height: 16),
              SizeSelector(
                sizes: sizes,
                selectedSize: selectedSize,              ),
              const SizedBox(height: 24),
              ColorSelector(
                availableColors: product.availableColors!,
                selectedColor: selectedColor,              ),
              const SizedBox(height: 48),
              _addToCart(localizations, product, context),
            ],
          ),
        ),
      ),
    );
  }

  Row _addToCart(
    AppLocalizations localizations,
    Product product,
    BuildContext context,
  ) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              localizations.totalPrice,
              style: AppTheme.getLightThemeData().textTheme.bodyMedium
                  ?.copyWith(
                    color: AppColors.blue.withValues(alpha: .9),
                    fontWeight: FontWeight.w400,
                  ),
            ),
            const SizedBox(height: 12),
            Text(
              'EGP ${_formatCommaNumber(product.price!)}',
              style: AppTheme.getLightThemeData().textTheme.headlineMedium
                  ?.copyWith(
                    color: AppColors.darkBlue,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ],
        ),
        const SizedBox(width: 33),
        Expanded(
          child: InkWell(
            onTap: () {
              //TODO: Implement add to cart functionality
            },
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.63,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17),
                color: AppColors.blue,
              ),
              child: Row(
                children: [
                  SvgPicture.asset(AppSvgs.addCartIcon),
                  const SizedBox(width: 15),
                  Text(
                    localizations.addToCart,
                    style: AppTheme.getLightThemeData().textTheme.bodyMedium
                        ?.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Container _productCount(Product product) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.3,
      ),
      decoration: BoxDecoration(
        color: AppColors.blue,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              productCounter.value =
                  productCounter.value == 0 ? 0 : productCounter.value - 1;
            },
            child: const Icon(
              Icons.remove_circle_outline,
              size: 20,
              color: AppColors.white,
            ),
          ),
          ValueListenableBuilder<int>(
            valueListenable: productCounter,
            builder: (context, productCounter, child) {
              return Text(
                '$productCounter',
                style: AppTheme.getLightThemeData().textTheme.headlineMedium
                    ?.copyWith(color: AppColors.white),
              );
            },
          ),
          InkWell(
            onTap: () {
              productCounter.value =
                  productCounter.value < product.quantity!
                      ? productCounter.value + 1
                      : productCounter.value;
            },
            child: const Icon(
              Icons.add_circle_outline,
              color: AppColors.white,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }

  String _formatCommaNumber(int price) {
    return price
        .toStringAsFixed(0)
        .replaceAllMapped(
          RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
          (Match m) => "${m[1]},",
        );
  }
}
