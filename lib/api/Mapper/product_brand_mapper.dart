import '../../Domain/entities/response/product/product_brand.dart';
import '../model/response/product/product_brand_dto.dart';

extension ProductBrandMapper on ProductBrandDto {
  ProductBrand toProductBrand() {
    return ProductBrand(id: id, name: name, slug: slug, image: image);
  }
}
