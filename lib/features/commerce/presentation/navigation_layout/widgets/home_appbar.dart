import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:route_e_commerce_v2/core/utils/app_assets.dart';
import 'package:route_e_commerce_v2/core/widgets/search_and_cart_widget.dart';

class HomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  final int tabIndex;
  const HomeAppbar({super.key, required this.tabIndex});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,

      title: SvgPicture.asset(AppSvgs.logo),
      bottom:
          tabIndex == 3
              ? PreferredSize(
                preferredSize: preferredSize,
                child: const SizedBox(),
              )
              : PreferredSize(
                preferredSize: preferredSize,
                child: const SearchAndCartWidget(),
              ),
    );
  }

  @override
  Size get preferredSize =>
      tabIndex == 3 ? const Size.fromHeight(56) : const Size.fromHeight(96);
}
