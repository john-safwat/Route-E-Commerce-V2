import 'package:flutter/material.dart';
import 'package:route_e_commerce_v2/core/l10n/translations/app_localizations.dart';
import 'package:route_e_commerce_v2/core/routing/routes.dart';
import 'package:route_e_commerce_v2/core/theme/app_colors.dart';
import 'package:route_e_commerce_v2/core/utils/app_assets.dart';
import 'package:route_e_commerce_v2/core/utils/validation.dart';
import 'package:route_e_commerce_v2/features/auth/widgets/auth_textfield.dart';


class Login extends StatelessWidget {
  Login({super.key});

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
                  const SizedBox(height: 80),

                  Text(
                    AppLocalizations.of(context)!.welcomeBackToRoute,
                    style: Theme.of(
                      context,
                    ).textTheme.headlineMedium!.copyWith(color: AppColors.white),
                  ),

                  Text(
                    AppLocalizations.of(context)!.pleaseSignInWithYourMail,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 40),



                  AuthTextField(
                    title: AppLocalizations.of(context)!.enterYourMail,
                    hintText: AppLocalizations.of(context)!.mail,
                    validator: Validation.validateEmail,
                  ),
                  SizedBox(height: 40),

                  AuthTextField(
                    title: AppLocalizations.of(context)!.enterYourPassword,
                    hintText: AppLocalizations.of(context)!.password,
                    validator: Validation.validatePassword,
                    obscureText: true,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          // TODO:  Navigate to forget password
                        },
                        child: Text(
                          AppLocalizations.of(context)!.forgetPassword,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 56),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.pushNamed(context, Routes.navigationRoute);
                    }
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: AppColors.white),
                  child: Text(
                    AppLocalizations.of(context)!.signIn,
                    style: Theme.of(
                      context,
                    ).textTheme.titleMedium!.copyWith(color: AppColors.darkBlue),
                  ),
                ),

                  const SizedBox(height: 32),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.dontHaveAnAccount,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      TextButton(
                        onPressed: () {
                          // TODO:  Navigate to create account
                        },

                        child: Text(
                          AppLocalizations.of(context)!.createAccount,
                          style: Theme.of(context).textTheme.titleLarge,
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
