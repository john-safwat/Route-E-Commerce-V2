import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/utils/app_constants.dart';
import 'package:route_e_commerce_v2/features/auth/data/datasource/contract/auth_local_datasource.dart';
import 'package:route_e_commerce_v2/network/results.dart';
import 'package:route_e_commerce_v2/network/safe_call.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable(as: AuthLocalDatasource)
class AuthLocalDatasourceImpl implements AuthLocalDatasource {
  SharedPreferences preferences;

  AuthLocalDatasourceImpl(this.preferences);

  @override
  Future<void> saveToke(String token) async {
    safeCall(() async {
      await preferences.setString(AppConstants.token, token);
      return Success(null);
    });
  }
}
