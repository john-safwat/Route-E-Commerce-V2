
import 'package:route_e_commerce_v2/features/commerce/domain/entities/sub_category.dart';

class SubCategoryDto {
  String? id;
  String? name;
  String? slug;
  String? category;
  String? createdAt;
  String? updatedAt;

  SubCategoryDto({
    this.id,
    this.name,
    this.slug,
    this.category,
    this.createdAt,
    this.updatedAt,
  });

  SubCategoryDto.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    category = json['category'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  SubCategory toEntity() {
    return SubCategory(
      id: id,
      name: name,
      slug: slug,
      categoryId: category,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
