import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_e_commerce_v2/core/di/di.dart';
import 'package:route_e_commerce_v2/core/l10n/translations/app_localizations.dart';
import 'package:route_e_commerce_v2/core/routing/routes.dart';
import 'package:route_e_commerce_v2/core/theme/app_colors.dart';
import 'package:route_e_commerce_v2/core/utils/app_assets.dart';
import 'package:route_e_commerce_v2/core/utils/validation.dart';
import 'package:route_e_commerce_v2/features/auth/presentation/login/view/login_cubit.dart';
import 'package:route_e_commerce_v2/features/auth/presentation/login/view/login_states.dart';
import 'package:route_e_commerce_v2/features/auth/presentation/widgets/auth_textfield.dart';
import 'package:route_e_commerce_v2/network/resources.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  LoginCubit cubit = getIt();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    cubit.navigation.listen((navigationEvent) {
      switch (navigationEvent) {
        case NavigateToRegisterScreen():
          {
            Navigator.pushReplacementNamed(context, Routes.registerRoute);
          }
        case NavigateToHomeScreen():
          {
            Navigator.pushReplacementNamed(context, Routes.navigationRoute);
          }
        case ShowLoginErrorToast():
          {
            CherryToast.error(
              title: Text(
                navigationEvent.errorMessage,
                style: const TextStyle(color: Colors.black),
              ),
            ).show(context);
          }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: Scaffold(
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
                    const SizedBox(height: 24),

                    Text(
                      AppLocalizations.of(context)!.welcomeBackToRoute,
                      style: Theme.of(context).textTheme.headlineMedium!
                          .copyWith(color: AppColors.white),
                    ),

                    Text(
                      AppLocalizations.of(context)!.pleaseSignInWithYourMail,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 16),

                    AuthTextField(
                      title: AppLocalizations.of(context)!.enterYourMail,
                      hintText: AppLocalizations.of(context)!.mail,
                      validator: Validation.validateEmail,
                      controller: emailController,
                    ),
                    const SizedBox(height: 16),

                    AuthTextField(
                      title: AppLocalizations.of(context)!.enterYourPassword,
                      hintText: AppLocalizations.of(context)!.password,
                      validator: Validation.validatePassword,
                      obscureText: true,
                      controller: passwordController,
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
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(color: AppColors.white),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    BlocBuilder<LoginCubit, LoginStates>(
                      builder:
                          (context, state) => ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                cubit.doAction(
                                  LoginUserAction(
                                    emailController.text,
                                    passwordController.text,
                                  ),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.white,
                            ),
                            child:
                                state.loginResource.status == Status.loading
                                    ? const CircularProgressIndicator()
                                    : Text(
                                      AppLocalizations.of(context)!.signIn,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(color: AppColors.darkBlue),
                                    ),
                          ),
                    ),

                    const SizedBox(height: 24),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.dontHaveAnAccount,
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(color: AppColors.white),
                        ),
                        TextButton(
                          onPressed: () {
                            cubit.doAction(NavigateToRegisterAction());
                          },
                          child: Text(
                            AppLocalizations.of(context)!.createAccount,
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(color: AppColors.white),
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
      ),
    );
  }
}
