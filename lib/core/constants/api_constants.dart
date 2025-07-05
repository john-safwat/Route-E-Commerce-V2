abstract class ApiConstants {
  static const String baseUrl = "https://ecommerce.routemisr.com";
  static const String getAllCategories = "/api/v1/categories";
  static const String getSpecificCategory = "/api/v1/categories/{categoryId}";
  static const String getAllProducts = "/api/v1/products";
  static const String getSpecificProduct = "/api/v1/products/{productId}";
  static const String signUp = "/api/v1/auth/signup";
  static const String signIn = "/api/v1/auth/signin";
  static const String forgetPassword = "/api/v1/auth/forgotPasswords";
  static const String verifyRestCode = "/api/v1/auth/verifyResetCode";
  static const String updatePassword = "/api/v1/users/changeMyPassword";
  static const String resetPassword = "/api/v1/auth/resetPassword";
  static const String updateLoggedPassword = "/api/v1/users/updateMe";
  static const String addProductToWishlist = "/api/v1/wishlist";
  static const String removeProductFromWishList = "/api/v1/wishlist/{id}";
  static const String getWishList = "/api/v1/wishlist";
  static const String cart = "/api/v1/cart";
  static const String updateCartProductQuantity = "/api/v1/cart/{id}";
  static const String removeProductFromCart = "/api/v1/cart/{id}";
}