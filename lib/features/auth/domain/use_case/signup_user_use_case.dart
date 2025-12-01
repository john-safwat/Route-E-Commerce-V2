
import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/features/auth/data/repo/auth_repo_impl.dart';
import 'package:route_e_commerce_v2/features/auth/domain/repository/auth_repository.dart';
import 'package:route_e_commerce_v2/network/results.dart';

@injectable
class SignupUserUseCase{

  AuthRepo authRepo;

  SignupUserUseCase(this.authRepo);

  Future<Results<String>> signUp(String name , String email , String password , String rePassword){
    return authRepo.signUp(name, email, password, rePassword);
  }

}