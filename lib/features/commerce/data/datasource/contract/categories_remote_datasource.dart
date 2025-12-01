
import 'package:route_e_commerce_v2/features/commerce/data/models/category_models/category_dto.dart';
import 'package:route_e_commerce_v2/network/results.dart';

abstract interface class CategoriesRemoteDatasource{

  Future<Results<List<CategoryDto>>> getCategories();

}