import 'package:flutter/material.dart';
import 'package:route_e_commerce_v2/core/l10n/translations/app_localizations.dart';
import 'package:route_e_commerce_v2/core/theme/app_colors.dart';
import 'package:route_e_commerce_v2/core/theme/app_theme.dart';

class ColorSelector extends StatelessWidget {
  final List<String> availableColors;
  final int selectedColor;
  final Function(int) onColorSelected;

  const ColorSelector({
    super.key,
    required this.availableColors,
    required this.selectedColor,
    required this.onColorSelected,
  });

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          localizations.color,
          style: AppTheme.getLightThemeData().textTheme.headlineMedium,
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 45,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => onColorSelected(index),
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: AppColors.nameToColor(
                    availableColors[index],
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.check,
                      color:
                          index == selectedColor
                              ? AppColors.white
                              : Colors.transparent,
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(width: 17),
            itemCount: availableColors.length,
          ),
        ),
      ],
    );
  }
}
