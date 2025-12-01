import 'package:route_e_commerce_v2/network/resources.dart';

class LoginStates {
  Resources<String> loginResource;

  LoginStates({this.loginResource = const Resources.initial()});

  LoginStates copyWith({Resources<String>? loginResource}) {
    return LoginStates(loginResource: loginResource ?? this.loginResource);
  }
}

sealed class LoginAction {}

class NavigateToRegisterAction extends LoginAction {}
class LoginUserAction extends LoginAction {
  String email;
  String password;
  LoginUserAction(this.email , this.password);
}

sealed class LoginNavigationAction {}

class NavigateToRegisterScreen extends LoginNavigationAction {}
class NavigateToHomeScreen extends LoginNavigationAction {}
class ShowLoginErrorToast extends LoginNavigationAction {
  String errorMessage;

  ShowLoginErrorToast(this.errorMessage);
}