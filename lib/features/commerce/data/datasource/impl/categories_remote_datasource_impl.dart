import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/features/commerce/data/datasource/contract/categories_remote_datasource.dart';
import 'package:route_e_commerce_v2/features/commerce/data/models/category_models/category_dto.dart';
import 'package:route_e_commerce_v2/network/api_client.dart';
import 'package:route_e_commerce_v2/network/app_exceptions.dart';
import 'package:route_e_commerce_v2/network/results.dart';
import 'package:route_e_commerce_v2/network/safe_call.dart';

@Injectable(as: CategoriesRemoteDatasource)
class CategoriesRemoteDatasourceImpl implements CategoriesRemoteDatasource {
  final ApiClient apiClient;

  CategoriesRemoteDatasourceImpl(this.apiClient);

  @override
  Future<Results<List<CategoryDto>>> getCategories() {
    return safeCall(() async {
      var response = await apiClient.getCategories();
      if (response.categories == null) {
        return Failure(NoCategoriesException(), "There is No Categories Found");
      }
      return Success(response.categories);
    });
  }
}
