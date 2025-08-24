import 'package:route_e_commerce_v2/features/navigation_layout/tabs/categories/data/models/brands_models/brand_dto.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/categories/data/models/category_models/category_dto.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/categories/data/models/sub_categories_models/sub_category_dto.dart';
import 'package:route_e_commerce_v2/features/products/domain/entity/product.dart';

class ProductsDto {
  int? sold;
  List<String>? images;
  List<SubCategoryDto>? subcategory;
  int? ratingsQuantity;
  String? sId;
  String? title;
  String? slug;
  String? description;
  int? quantity;
  int? price;
  String? imageCover;
  CategoryDto? category;
  BrandDto? brand;
  double? ratingsAverage;
  String? createdAt;
  String? updatedAt;
  String? id;
  int? priceAfterDiscount;
  List<String>? availableColors;

  ProductsDto({
    this.sold,
    this.images,
    this.subcategory,
    this.ratingsQuantity,
    this.sId,
    this.title,
    this.slug,
    this.description,
    this.quantity,
    this.price,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
    this.createdAt,
    this.updatedAt,
    this.id,
    this.priceAfterDiscount,
    this.availableColors,
  });

  ProductsDto.fromJson(Map<String, dynamic> json) {
    sold = json['sold'];
    images = json['images']?.cast<String>();
    if (json['subcategory'] != null) {
      subcategory = <SubCategoryDto>[];
      json['subcategory'].forEach((v) {
        subcategory!.add(SubCategoryDto.fromJson(v));
      });
    }
    ratingsQuantity = json['ratingsQuantity'];
    sId = json['_id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    quantity = json['quantity'];
    price = json['price'];
    imageCover = json['imageCover'];
    category =
        json['category'] != null
            ? CategoryDto.fromJson(json['category'])
            : null;
    brand = json['brand'] != null ? BrandDto.fromJson(json['brand']) : null;
    ratingsAverage = json['ratingsAverage']?.toDouble();
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    id = json['id'];
    priceAfterDiscount = json['priceAfterDiscount'];
    availableColors = json['availableColors']?.cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sold'] = sold;
    data['images'] = images;
    if (subcategory != null) {
      data['subcategory'] = subcategory!.map((v) => v.toJson()).toList();
    }
    data['ratingsQuantity'] = ratingsQuantity;
    data['_id'] = sId;
    data['title'] = title;
    data['slug'] = slug;
    data['description'] = description;
    data['quantity'] = quantity;
    data['price'] = price;
    data['imageCover'] = imageCover;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    if (brand != null) {
      data['brand'] = brand!.toJson();
    }
    data['ratingsAverage'] = ratingsAverage;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['id'] = id;
    data['priceAfterDiscount'] = priceAfterDiscount;
    data['availableColors'] = availableColors;
    return data;
  }

  Product toEntity() {
    return Product(
      id: id,
      title: title,
      description: description,
      price: price,
      priceAfterDiscount: priceAfterDiscount,
      imageCover: imageCover,
      images: images,
      categoryId: category?.id,
      brandId: brand?.id,
      ratingsAverage: ratingsAverage,
      ratingsQuantity: ratingsQuantity,
      quantity: quantity,
      availableColors: availableColors,
    );
  }
}
