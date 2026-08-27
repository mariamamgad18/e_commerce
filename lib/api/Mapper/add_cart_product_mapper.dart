import '../../Domain/entities/response/get_cart/brand.dart';
import '../../Domain/entities/response/get_cart/category.dart';
import '../../Domain/entities/response/get_cart/product.dart';
import '../model/response/cart/get_cart/product_dto.dart';
import 'get_cart_brand_mapper.dart';
import 'get_cart_category_mapper.dart';
import 'get_cart_subcategory_mapper.dart';

extension AddCartProductMapper on ProductDto {
  Product toProduct() {
    return Product(
      id: id ?? '',
      title: title ?? '',
      quantity: quantity ?? 0,
      imageCover: imageCover ?? '',
      ratingsAverage: ratingsAverage ?? 0.0,
      productId: productId ?? '',

      category:
          category?.toCategory() ??
          Category(id: '', name: '', slug: '', image: ''),

      brand: brand?.toBrand() ?? Brand(id: '', name: '', slug: '', image: ''),

      subcategory: subcategory?.map((e) => e.toSubcategory()).toList() ?? [],
    );
  }
}
