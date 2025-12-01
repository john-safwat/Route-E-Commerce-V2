
import 'package:route_e_commerce_v2/network/results.dart';

abstract interface class AuthRepo{

  Future<Results<String>> signUp(String name , String email , String password , String rePassword);
  Future<Results<String>> login(String email , String password);

}