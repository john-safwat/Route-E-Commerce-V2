import 'package:flutter/material.dart';
import 'package:route_e_commerce_v2/core/theme/app_colors.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({required this.active, super.key});

  final bool active;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(horizontal: screenSize.width * .01),
      height: 7,
      width: active ? 30 : 7,
      decoration: BoxDecoration(
        color: active ? AppColors.blue : AppColors.grey.withAlpha(40),
        border: !active ? Border.all(color: AppColors.blue, width: 1) : null,
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }
}
