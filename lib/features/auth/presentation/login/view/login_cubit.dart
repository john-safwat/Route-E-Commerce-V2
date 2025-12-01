import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/base/base_cubit.dart';
import 'package:route_e_commerce_v2/features/auth/domain/use_case/login_user_use_case.dart';
import 'package:route_e_commerce_v2/features/auth/presentation/login/view/login_states.dart';
import 'package:route_e_commerce_v2/network/resources.dart';
import 'package:route_e_commerce_v2/network/results.dart';

@injectable
class LoginCubit
    extends BaseCubit<LoginStates, LoginAction, LoginNavigationAction> {
  LoginUserUseCase loginUserUseCase;

  LoginCubit(this.loginUserUseCase) : super(LoginStates());

  @override
  Future<void> doAction(LoginAction action) async {
    switch (action) {
      case NavigateToRegisterAction():
        {
          _navigateToRegister();
        }
      case LoginUserAction():
        {
          await _login(action);
        }
    }
  }

  Future<void> _login(LoginUserAction action) async {
     emit(state.copyWith(loginResource: const Resources.loading()));
    var response = await loginUserUseCase.call(
      action.email,
      action.password,
    );
    switch (response) {
      case Success<String>():
        {
          emit(
            state.copyWith(
              loginResource: Resources.success(data: response.data),
            ),
          );
          emitNavigation(NavigateToHomeScreen());
        }
      case Failure<String>():
        {
          emit(
            state.copyWith(
              loginResource: Resources.failure(
                exception: response.exception,
                message: response.message,
              ),
            ),
          );
          emitNavigation(ShowLoginErrorToast(response.message));

        }
    }
  }

  void _navigateToRegister() {
    emitNavigation(NavigateToRegisterScreen());
  }
}
