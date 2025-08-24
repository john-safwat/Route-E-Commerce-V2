import 'package:route_e_commerce_v2/features/cart/domain/entities/cart.dart';
import 'package:route_e_commerce_v2/features/cart/domain/entities/cart_product_entity.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/categories/domain/entities/category.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/favorite/domain/entities/wishlist_entity.dart';
import 'package:route_e_commerce_v2/features/products/domain/entity/product.dart';

abstract class DummyDataProvider {
  static List<Category> generateCategories() {
    List<Category> categories = [];
    for (int i = 1; i <= 50; i++) {
      categories.add(
        Category(
          id: i.toString(),
          name: 'SuperMarket',
          image:
              'https://ecommerce.routemisr.com/Route-Academy-categories/1681511452254.png',
        ),
      );
    }
    return categories;
  }

  static List<Product> generateProducts() {
    List<Product> products = [];
    for (int i = 1; i <= 50; i++) {
      products.add(
        Product(
          id: '$i',
          title: 'Softride Enzo NXT',
          description: 'Sole Material: Rubber, Colour: RED, Department: Men',
          price: 2999,
          priceAfterDiscount: 2699,
          imageCover:
              'https://ecommerce.routemisr.com/Route-Academy-products/1680399913757-cover.jpeg',
          images: [
            'https://ecommerce.routemisr.com/Route-Academy-products/1680399913850-1.jpeg',
            'https://ecommerce.routemisr.com/Route-Academy-products/1680399913851-4.jpeg',
            'https://ecommerce.routemisr.com/Route-Academy-products/1680399913850-2.jpeg',
          ],
          categoryId: '6439d5b90049ad0b52b90048',
          brandId: '64089d5c24b25627a253159f',
          ratingsAverage: 2.8 + (i % 5) * 0.1,
          ratingsQuantity: 20 + i,
          quantity: 100 + i,
          availableColors: ['Red', 'Black', 'Blue'],
        ),
      );
    }
    return products;
  }

  static Cart generateProductsInCart() {
    List<CartProduct> cartProducts = [];
    final List<String> colors = ['Red', 'Black', 'Blue', 'Green', 'Yellow'];
    // final List<int> sizes = [40, 41, 42, 43, 44];
    for (int i = 1; i <= 10; i++) {
      cartProducts.add(
        CartProduct(
          id: '$i',
          count: 1 + (i % 3),
          price: 3500 + (i * 100),
          product: Product(
            id: '$i',
            title: 'Nike Air Jordon',
            description:
                'Sole Material: Rubber, Colour: ${colors[i % 5]}, Department: Men',
            price: 3500 + (i * 100),
            priceAfterDiscount: 3300 + (i * 90),
            imageCover:
                'https://ecommerce.routemisr.com/Route-Academy-products/1680399913757-cover.jpeg',
            images: [
              'https://ecommerce.routemisr.com/Route-Academy-products/1680399913850-1.jpeg',
              'https://ecommerce.routemisr.com/Route-Academy-products/1680399913851-4.jpeg',
              'https://ecommerce.routemisr.com/Route-Academy-products/1680399913850-2.jpeg',
            ],
            categoryId: '6439d5b90049ad0b52b90048',
            brandId: '64089d5c24b25627a253159f',
            ratingsAverage: 4.0 + (i % 5) * 0.1,
            ratingsQuantity: 50 + i,
            quantity: 200 + i,
            availableColors: colors,
          ),
        ),
      );
    }

    int totalCartPrice = cartProducts.fold(
      0,
      (sum, item) => sum + (item.price! * item.count!),
    );
    return Cart(
      id: 'cart_001',
      cartOwner: 'user_001',
      products: cartProducts,
      createdAt: DateTime.now().toIso8601String(),
      updatedAt: DateTime.now().toIso8601String(),
      version: 1,
      totalCartPrice: totalCartPrice,
    );
  }

  static Wishlist generateWishlistProducts() {
    List<Product> wishlistProducts = [];
    final List<String> colors = ['Red', 'Black', 'Blue', 'Green', 'Yellow'];
    for (int i = 1; i <= 8; i++) {
      wishlistProducts.add(
        Product(
          id: '$i',
          title: 'Nike Air Jordon $i',
          description:
              'Sole Material: Rubber, Colour: ${colors[i % 5]}, Department: Men',
          price: 1500 + (i * 200),
          priceAfterDiscount: 1300 + (i * 180),
          imageCover:
              'https://ecommerce.routemisr.com/Route-Academy-products/1680399913757-cover.jpeg',
          images: [
            'https://ecommerce.routemisr.com/Route-Academy-products/1680399913850-1.jpeg',
            'https://ecommerce.routemisr.com/Route-Academy-products/1680399913851-4.jpeg',
            'https://ecommerce.routemisr.com/Route-Academy-products/1680399913850-2.jpeg',
          ],
          categoryId: '6439d5b90049ad0b52b90048',
          brandId: '64089d5c24b25627a253159f',
          ratingsAverage: 4.0 + (i % 5) * 0.1,
          ratingsQuantity: 10 + i,
          quantity: 50 + i,
          availableColors: colors,
        ),
      );
    }
    return Wishlist(count: 8, products: wishlistProducts);
  }
}
