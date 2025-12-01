import 'package:route_e_commerce_v2/features/auth/data/models/auth_response_dto.dart';

import '../../../../../network/results.dart';

abstract interface class AuthRemoteDatasource {

  Future<Results<AuthResponseDto>> signUp(String email, String name,
      String password, String rePassword);

  Future<Results<AuthResponseDto>> login(String email , String password);

}