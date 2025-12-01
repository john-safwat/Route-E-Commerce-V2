import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/features/commerce/data/models/category_models/category_dto.dart';
import 'package:route_e_commerce_v2/features/commerce/domain/entities/category.dart';

@injectable
class CommerceMapper {
  List<Category> mapCategoryDtoListToCategoriesList(
    List<CategoryDto> categories,
  ) {
    return categories
        .map((category) => _mapCategoryDtoToEntity(category))
        .toList();
  }

  Category _mapCategoryDtoToEntity(CategoryDto categoryDto) {
    return Category(
      id: categoryDto.id,
      name: categoryDto.name,
      slug: categoryDto.slug,
      image: categoryDto.image,
      createdAt: categoryDto.createdAt,
      updatedAt: categoryDto.updatedAt,
    );
  }
}
