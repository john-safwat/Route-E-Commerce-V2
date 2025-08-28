import 'package:flutter/material.dart';
import 'package:route_e_commerce_v2/core/l10n/translations/app_localizations.dart';

extension AppSize on BuildContext {
  Size get screenSize => MediaQuery.sizeOf(this);
}

extension AppLocal on BuildContext {
  AppLocalizations? get locale => AppLocalizations.of(this);
}
