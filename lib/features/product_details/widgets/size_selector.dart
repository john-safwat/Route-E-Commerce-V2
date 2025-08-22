import 'package:flutter/material.dart';
import 'package:route_e_commerce_v2/core/l10n/translations/app_localizations.dart';
import 'package:route_e_commerce_v2/core/theme/app_colors.dart';
import 'package:route_e_commerce_v2/core/theme/app_theme.dart';

class SizeSelector extends StatelessWidget {
  final List<int> sizes;
  final ValueNotifier<int> selectedSize;

  const SizeSelector({
    super.key,
    required this.sizes,
    required this.selectedSize,
  });

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          localizations.size,
          style: AppTheme.getLightThemeData().textTheme.headlineMedium,
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 45,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => selectedSize.value = index,
                child: ValueListenableBuilder(
                  valueListenable: selectedSize,
                  builder: (context, value, child) {
                    return CircleAvatar(
                      radius: 22,
                      backgroundColor:
                          index == selectedSize
                              ? AppColors.blue
                              : Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 9,
                          vertical: 9,
                        ),
                        child: Text(
                          '${sizes[index]}',
                          style: AppTheme.getLightThemeData()
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                color:
                                    index == selectedSize
                                        ? AppColors.white
                                        : AppColors.blue,
                              ),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(width: 17),
            itemCount: sizes.length,
          ),
        ),
      ],
    );
  }
}
