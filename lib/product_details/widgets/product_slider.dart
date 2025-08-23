import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:route_e_commerce_v2/core/theme/app_colors.dart';
import 'package:route_e_commerce_v2/core/utils/app_assets.dart';
import 'package:route_e_commerce_v2/product_details/widgets/dot_indicator.dart';

class ProductSlider extends StatefulWidget {
  final List<String> items;
  final int initialIndex;
  const ProductSlider({
    super.key,
    required this.initialIndex,
    required this.items,
  });

  @override
  State<ProductSlider> createState() => _ProductSliderState();
}

class _ProductSliderState extends State<ProductSlider> {
  final CarouselSliderController _controller = CarouselSliderController();
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CarouselSlider(
          carouselController: _controller,
          items:
              widget.items.map((url) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: CachedNetworkImage(
                    width: double.infinity,
                    height: 120,
                    fit: BoxFit.cover,
                    imageUrl: url,
                    placeholder:
                        (context, url) => const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.blue,
                          ),
                        ),
                    errorWidget:
                        (context, url, error) =>
                            const Icon(Icons.error, color: AppColors.red),
                  ),
                );
              }).toList(),
          options: CarouselOptions(
            aspectRatio: 199 / 150,
            initialPage: widget.initialIndex,
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
        ),
        Positioned(
          top: 8,
          right: 8,
          child: Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(60),
              boxShadow: [
                BoxShadow(
                  color: AppColors.grey.withAlpha(30),
                  blurRadius: 6,
                  spreadRadius: 2,
                  offset: const Offset(1, 4),
                ),
              ],
            ),
            child: InkWell(
              onTap: () {
                // todo add to favorite
              },
              child: SvgPicture.asset(AppSvgs.inactiveFavoriteIcon),
            ),
          ),
        ),
        _dotsIindicator(),
      ],
    );
  }

  Padding _dotsIindicator() {
    return Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
              widget.items.map((e) {
                return DotIndicator(
                  active: widget.items.indexOf(e) == currentIndex,
                );
              }).toList(),
        ),
      );
  }
}
