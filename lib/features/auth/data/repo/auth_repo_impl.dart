import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/di/di.dart';
import 'package:route_e_commerce_v2/features/auth/data/datasource/contract/auth_local_datasource.dart';
import 'package:route_e_commerce_v2/features/auth/data/datasource/contract/auth_remote_datasource.dart';
import 'package:route_e_commerce_v2/features/auth/data/models/auth_response_dto.dart';
import 'package:route_e_commerce_v2/features/auth/domain/repository/auth_repository.dart';
import 'package:route_e_commerce_v2/network/results.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  AuthRemoteDatasource remoteDatasource;
  AuthLocalDatasource localDatasource;
  AuthRepoImpl(this.remoteDatasource , this.localDatasource);

  @override
  Future<Results<String>> signUp(
    String name,
    String email,
    String password,
    String rePassword,
  ) async {
    var response = await remoteDatasource.signUp(
      email,
      name,
      password,
      rePassword,
    );
    return switch (response) {
      Success<AuthResponseDto>() => Success(response.data?.token),
      Failure<AuthResponseDto>() => Failure(
        response.exception,
        response.message,
      ),
    };
  }

  @override
  Future<Results<String>> login(String email, String password) async {
    var response = await remoteDatasource.login(email, password);
    switch (response) {
      case Success<AuthResponseDto>():
        {
          await localDatasource.saveToke(response.data?.token ?? "");
          getIt<Dio>().options.headers["token"] = response.data?.token ?? "";
          return Success(response.data?.token);
        }
      case Failure<AuthResponseDto>():
        {
          return Failure(response.exception, response.message);
        }
    }
  }
}
