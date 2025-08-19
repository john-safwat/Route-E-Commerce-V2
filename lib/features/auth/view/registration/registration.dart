import 'package:flutter/material.dart';
import 'package:route_e_commerce_v2/core/extensions/context_extensions.dart';
import 'package:route_e_commerce_v2/core/l10n/translations/app_localizations.dart';
import 'package:route_e_commerce_v2/core/theme/app_colors.dart';
import 'package:route_e_commerce_v2/core/utils/app_assets.dart';
import 'package:route_e_commerce_v2/core/utils/validation.dart';

import '../widgets/auth_elevated_button.dart';
import '../widgets/auth_textfield.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var mobileController = TextEditingController();
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
                  SizedBox(height: context.screenSize.height * .02),
                  AuthTextField(
                    title: context.locale!.fullName,
                    hintText: AppLocalizations.of(context)!.enterYourFullName,
                    validator:
                        (String? value) =>
                            Validation.validateEmptyValue(context, value),
                  ),
                  SizedBox(height: context.screenSize.height * .03),
                  AuthTextField(
                    title: AppLocalizations.of(context)!.mobileNumber,
                    hintText:
                        AppLocalizations.of(context)!.enterYourMobileNumber,
                    validator:
                        (String? value) =>
                            Validation.validateEmptyValue(context, value),
                    keyboardType: TextInputType.phone,
                  ),
                  SizedBox(height: context.screenSize.height * .03),
                  AuthTextField(
                    title: AppLocalizations.of(context)!.email,
                    hintText: AppLocalizations.of(context)!.enterYourEmail,
                    validator:
                        (String? value) =>
                            Validation.validateEmail(context, value),
                  ),
                  SizedBox(height: context.screenSize.height * .03),
                  AuthTextField(
                    title: AppLocalizations.of(context)!.password,
                    hintText: AppLocalizations.of(context)!.enterYourPassword,
                    validator:
                        (String? value) =>
                            Validation.validatePassword(context, value),
                    obscureText: true,
                  ),
                  SizedBox(height: context.screenSize.height * .04),
                  AuthElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {}
                    },
                    title: AppLocalizations.of(context)!.signUp,
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
