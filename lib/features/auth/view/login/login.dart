import 'package:flutter/material.dart';
import 'package:route_e_commerce_v2/core/extensions/context_extensions.dart';
import 'package:route_e_commerce_v2/core/l10n/translations/app_localizations.dart';
import 'package:route_e_commerce_v2/core/routing/routes.dart';
import 'package:route_e_commerce_v2/core/theme/app_colors.dart';
import 'package:route_e_commerce_v2/core/utils/app_assets.dart';
import 'package:route_e_commerce_v2/core/utils/validation.dart';

import '../widgets/auth_elevated_button.dart';
import '../widgets/auth_textfield.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue,
      body: Form(
        key: formKey,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(AppImages.logo),
                  SizedBox(height: context.screenSize.height * .06),

                  Text(
                    AppLocalizations.of(context)!.welcomeBackToRoute,
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Text(
                    AppLocalizations.of(context)!.pleaseSignInWithYourMail,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(height: context.screenSize.height * .03),

                  AuthTextField(
                    title: AppLocalizations.of(context)!.userName,
                    hintText: AppLocalizations.of(context)!.enterYourName,
                    validator:
                        (String? val) =>
                            Validation.validateEmptyValue(context, val),
                  ),
                  SizedBox(height: context.screenSize.height * .03),

                  AuthTextField(
                    title: AppLocalizations.of(context)!.password,
                    hintText: AppLocalizations.of(context)!.enterYourPassword,
                    validator:
                        (String? val) =>
                            Validation.validatePassword(context, val),
                    obscureText: true,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          AppLocalizations.of(context)!.forgetPassword,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: context.screenSize.height * .04),

                  AuthElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.pushNamed(context, Routes.navigationRoute);
                      }
                    },
                    title: AppLocalizations.of(context)!.login,
                  ),
                  SizedBox(height: context.screenSize.height * .04),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.dontHaveAnAccount,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(width: 5),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            Routes.registrationRoute,
                          );
                        },

                        child: Text(
                          AppLocalizations.of(context)!.createAccount,
                          style: Theme.of(context).textTheme.titleLarge!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
