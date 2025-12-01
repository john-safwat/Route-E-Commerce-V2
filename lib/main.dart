import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:route_e_commerce_v2/core/di/di.dart';
import 'package:route_e_commerce_v2/core/l10n/translations/app_localizations.dart';
import 'package:route_e_commerce_v2/core/routing/app_router.dart';
import 'package:route_e_commerce_v2/core/routing/routes.dart';
import 'package:route_e_commerce_v2/core/theme/app_theme.dart';
import 'package:route_e_commerce_v2/core/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await configureDependencies();

  // load user token form shared preferences for auto login
  SharedPreferences preferences = getIt();
  var token = preferences.getString(AppConstants.token);
  runApp(MyApp(token: token));

  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  final String? token;

  const MyApp({this.token, super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Route E-Commerce",
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: const Locale("en"),
      theme: AppTheme.getLightThemeData(),
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: token != null ? Routes.navigationRoute : Routes.loginRoute,
    );
  }
}
