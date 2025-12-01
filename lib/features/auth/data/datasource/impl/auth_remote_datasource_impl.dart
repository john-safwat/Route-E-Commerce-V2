import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/features/auth/data/datasource/contract/auth_remote_datasource.dart';
import 'package:route_e_commerce_v2/features/auth/data/models/auth_response_dto.dart';
import 'package:route_e_commerce_v2/features/auth/data/models/login_request_dto.dart';
import 'package:route_e_commerce_v2/features/auth/data/models/register_request_dto.dart';
import 'package:route_e_commerce_v2/network/api_client.dart';
import 'package:route_e_commerce_v2/network/app_exceptions.dart';
import 'package:route_e_commerce_v2/network/results.dart';
import 'package:route_e_commerce_v2/network/safe_call.dart';

@Injectable(as: AuthRemoteDatasource)
class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  ApiClient apiClient;

  AuthRemoteDatasourceImpl(this.apiClient);

  @override
  Future<Results<AuthResponseDto>> signUp(
    String email,
    String name,
    String password,
    String rePassword,
  ) async {
    return safeCall(() async {
      var registerRequest = RegisterRequestDto(
        name: name,
        email: email,
        password: password,
        rePassword: rePassword,
      );
      var response = await apiClient.signUp(registerRequest);
      if (response.statusMsg != null) {
        return Failure(AuthException(), response.message ?? "");
      }
      return Success(response);
    });
  }

  @override
  Future<Results<AuthResponseDto>> login(String email, String password) {
    return safeCall(() async {
      var response = await apiClient.signIn(
        LoginRequestDto(email: email, password: password),
      );
      if (response.statusMsg != null) {
        return Failure(AuthException(), response.message ?? "");
      }
      return Success(response);
    });
  }
}
