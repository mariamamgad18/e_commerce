import '../../Domain/entities/response/product/product_sub_category.dart';
import '../model/response/product/product_sub_category_dto.dart';

extension ProductSubCategoryMapper on ProductSubCategoryDto {
  ProductSubCategory toProductSubCategory() {
    return ProductSubCategory(
      id: id,
      name: name,
      slug: slug,
      category: category,
    );
  }
}
