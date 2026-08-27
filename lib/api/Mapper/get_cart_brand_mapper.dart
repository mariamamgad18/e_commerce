import '../../Domain/entities/response/get_cart/brand.dart';
import '../model/response/cart/get_cart/brand_dto.dart';

extension GetCartBrandMapper on BrandDto {
  Brand toBrand() {
    return Brand(
      id: id ?? '',
      name: name ?? '',
      slug: slug ?? '',
      image: image ?? '',
    );
  }
}
