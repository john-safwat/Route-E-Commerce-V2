import 'category_dto.dart';
import 'meta_data_dto.dart';

class CategoriesResponseDto {
  int? results;
  MetaDataDto? metadata;
  List<CategoryDto>? categories;

  CategoriesResponseDto({this.results, this.metadata, this.categories});

  CategoriesResponseDto.fromJson(Map<String, dynamic> json) {
    results = json['results'];
    metadata =
        json['metadata'] != null
            ? MetaDataDto.fromJson(json['metadata'])
            : null;
    if (json['data'] != null) {
      categories = <CategoryDto>[];
      json['data'].forEach((v) {
        categories!.add(CategoryDto.fromJson(v));
      });
    }
  }
}
