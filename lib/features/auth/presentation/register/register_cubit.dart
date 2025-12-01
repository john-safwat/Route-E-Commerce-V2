import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/base/base_cubit.dart';
import 'package:route_e_commerce_v2/features/auth/domain/use_case/signup_user_use_case.dart';
import 'package:route_e_commerce_v2/features/auth/presentation/register/register_contract.dart';
import 'package:route_e_commerce_v2/network/resources.dart';
import 'package:route_e_commerce_v2/network/results.dart';

@injectable
class RegisterCubit
    extends BaseCubit<RegisterState, RegisterAction, RegisterNavigationAction> {
  SignupUserUseCase useCase;

  RegisterCubit(this.useCase) : super(RegisterState());

  @override
  Future<void> doAction(RegisterAction action) async {
    switch (action) {
      case RegisterUserAction():
        {
          await _register(action);
        }
    }
  }

  Future<void> _register(RegisterUserAction action) async {
    emit(state.copyWith(loginResources: const Resources.loading()));
    var response = await useCase.signUp(
      action.name,
      action.email,
      action.password,
      action.rePassword,
    );
    switch (response) {
      case Success<String>():
        {
          emit(
            state.copyWith(
              loginResources: Resources.success(data: response.data),
            ),
          );
          emitNavigation(NavigateToLogin());
        }
      case Failure<String>():
        {
          emitNavigation(ShowRegisterErrorToast(response.message));
          emit(
            state.copyWith(
              loginResources: Resources.failure(
                exception: response.exception,
                message: response.message,
              ),
            ),
          );
        }
    }
  }
}
