import '../../Domain/entities/response/get_cart/category.dart';
import '../model/response/cart/get_cart/category_dto.dart';

extension GetCartCategoryMapper on CategoryDto {
  Category toCategory() {
    return Category(
      id: id ?? '',
      name: name ?? '',
      slug: slug ?? '',
      image: image ?? '',
    );
  }
}
