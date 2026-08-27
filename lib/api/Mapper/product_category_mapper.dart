import '../../Domain/entities/response/product/product_category.dart';
import '../model/response/product/product_category_dto.dart';

extension ProductCategoryMapper on ProductCategoryDto {
  ProductCategory toProductCategory() {
    return ProductCategory(id: id, name: name, slug: slug, image: image);
  }
}
