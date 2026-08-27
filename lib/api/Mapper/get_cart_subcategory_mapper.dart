import '../../Domain/entities/response/get_cart/subcategory.dart';
import '../model/response/cart/get_cart/subcategory_dto.dart';

extension GetCartSubcategoryMapper on SubcategoryDto {
  Subcategory toSubcategory() {
    return Subcategory(
      id: id ?? '',
      name: name ?? '',
      slug: slug ?? '',
      category: category ?? '',
    );
  }
}
