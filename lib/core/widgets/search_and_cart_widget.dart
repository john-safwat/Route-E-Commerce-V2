import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:route_e_commerce_v2/core/routing/routes.dart';
import 'package:route_e_commerce_v2/core/utils/app_assets.dart';
import 'package:route_e_commerce_v2/core/widgets/custom_search_field.dart';

class SearchAndCartWidget extends StatelessWidget {
  const SearchAndCartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        spacing: 8,
        children: [
          const Expanded(child: CustomSearchField()),
          InkWell(
            borderRadius: BorderRadius.circular(1000),
            onTap: () {
              Navigator.pushNamed(context, Routes.cartRoute);
            },
            child: SvgPicture.asset(AppSvgs.cartIcon),
          ),
        ],
      ),
    );
  }
}
