import 'package:route_e_commerce_v2/network/resources.dart';

class RegisterState {
  Resources<String> loginResources;

  RegisterState({this.loginResources = const Resources.initial()});

  RegisterState copyWith({Resources<String>? loginResources}) {
    return RegisterState(loginResources: loginResources ?? this.loginResources);
  }
}

sealed class RegisterAction {}

class RegisterUserAction extends RegisterAction {
  String name;
  String email;

  String password;
  String rePassword;

  RegisterUserAction(this.name, this.email, this.password, this.rePassword);
}

sealed class RegisterNavigationAction {}

class NavigateToLogin extends RegisterNavigationAction {}

class ShowRegisterErrorToast extends RegisterNavigationAction {
  String errorMessage;

  ShowRegisterErrorToast(this.errorMessage);
}
