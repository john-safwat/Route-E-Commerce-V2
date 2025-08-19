import 'package:flutter/material.dart';
import 'package:route_e_commerce_v2/core/extensions/context_extensions.dart';

class Validation {
  static String? validateEmail(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      return context.locale!.emailRequired;
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return context.locale!.emailInvalid;
    }
    return null;
  }

  static String? validatePassword(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      return context.locale!.passwordRequired;
    }
    if (value.length < 6) {
      return context.locale!.passwordTooShort;
    }
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return context.locale!.passwordUppercase;
    }
    if (!value.contains(RegExp(r'[0-9]'))) {
      return context.locale!.passwordNumber;
    }
    return null;
  }

  static String? validateEmptyValue(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return context.locale!.fieldRequired;
    }
    return null;
  }
}
