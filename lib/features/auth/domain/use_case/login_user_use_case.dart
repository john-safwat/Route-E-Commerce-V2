import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/features/auth/domain/repository/auth_repository.dart';
import 'package:route_e_commerce_v2/network/results.dart';

@injectable
class LoginUserUseCase {
  AuthRepo repo;

  LoginUserUseCase(this.repo);

  Future<Results<String>> call(String email, String password) =>
      repo.login(email, password);
}
