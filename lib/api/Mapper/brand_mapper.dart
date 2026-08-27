import 'package:ecommerce/Domain/entities/response/Brands/brand_data.dart';
import 'package:ecommerce/api/model/response/Brands/brand_data_dto.dart';

extension BrandMapper on BrandDataDto {
  BrandData toBrandData() {
    return BrandData(
      id: id,
      name: name,
      slug: slug,
      image: image,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
