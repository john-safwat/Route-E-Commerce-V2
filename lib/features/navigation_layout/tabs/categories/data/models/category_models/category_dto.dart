import '../../../domain/entities/category.dart';

class CategoryDto {
  String? id;
  String? name;
  String? slug;
  String? image;
  String? createdAt;
  String? updatedAt;

  CategoryDto({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  CategoryDto.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['image'] = image;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }

  Category toEntity() {
    return Category(
      id: id,
      name: name,
      slug: slug,
      image: image,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
