import 'package:route_e_commerce_v2/features/commerce/domain/entities/category.dart';
import 'package:route_e_commerce_v2/network/resources.dart';

class CategoriesTabState {
  Resources<List<Category>> categories;

  CategoriesTabState({this.categories = const Resources.initial()});

  CategoriesTabState copyWith({Resources<List<Category>>? categories}) {
    return CategoriesTabState(categories: categories ?? this.categories);
  }
}

sealed class CategoriesTabEvents {}

class LoadCategoriesEvent extends CategoriesTabEvents {}
