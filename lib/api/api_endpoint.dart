class ApiEndpoint {
  static const String BaseUrl = 'https://ecommerce.routemisr.com/';

  static const String LoginApi = 'api/v1/auth/signin';

  static const String RegisterApi = 'api/v1/auth/signup';

  static const String CategoryApi = 'api/v1/categories';

  static const String BrandApi = 'api/v1/brands';

  static const String ProductApi = 'api/v1/products';

  static const String CartApi = 'api/v1/cart';

  static const String DeleteItemInCartApi = 'api/v1/cart/{cartItemId}';

  static const String UpdateItemInCartApi = 'api/v1/cart/{cartItemId}';
}
