import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:route_e_commerce_v2/features/auth/data/datasource/contract/auth_remote_datasource.dart';
import 'package:route_e_commerce_v2/features/auth/data/datasource/impl/auth_remote_datasource_impl.dart';
import 'package:route_e_commerce_v2/features/auth/data/repo/auth_repo_impl.dart';
import 'package:route_e_commerce_v2/features/auth/domain/repository/auth_repository.dart';
import 'package:route_e_commerce_v2/features/auth/domain/use_case/signup_user_use_case.dart';
import 'package:route_e_commerce_v2/features/auth/presentation/register/register_cubit.dart';
import 'package:route_e_commerce_v2/network/api_client.dart';

GetIt getIt = GetIt.instance;

// void configureDependenciesGetIt() {
//   // getIt.registerSingleton<Dio>(provideDio());
//   getIt.registerSingleton<ApiClient>(ApiClient(getIt()));
//   getIt.registerFactory<AuthRemoteDatasource>(
//     () => AuthRemoteDatasourceImpl(getIt()),
//   );
//   getIt.registerFactory<AuthRepo>(() => AuthRepoImpl(getIt()));
//   getIt.registerFactory<SignupUserUseCase>(() => SignupUserUseCase(getIt()));
//   getIt.registerFactory<RegisterCubit>(() => RegisterCubit(getIt()));
// }
