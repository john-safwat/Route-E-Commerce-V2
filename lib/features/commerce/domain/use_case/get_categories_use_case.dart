import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/features/commerce/domain/entities/category.dart';
import 'package:route_e_commerce_v2/features/commerce/domain/repository/commerce_repo.dart';
import 'package:route_e_commerce_v2/network/results.dart';

@injectable
class GetCategoriesUseCase {
  final CommerceRepo repo;

  GetCategoriesUseCase(this.repo);

  Future<Results<List<Category>>> call() {
    return repo.getCategories();
  }
}
