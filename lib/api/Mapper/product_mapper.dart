import '../../Domain/entities/response/product/product_data.dart';
import '../model/response/product/product_data_dto.dart';
import 'product_brand_mapper.dart';
import 'product_category_mapper.dart';
import 'product_sub_category_mapper.dart';

extension ProductMapper on ProductDataDto {
  ProductData toProductData() {
    return ProductData(
      sold: sold,
      images: images,
      subcategory: subcategory?.map((e) => e.toProductSubCategory()).toList(),
      ratingsQuantity: ratingsQuantity,
      id: id,
      title: title,
      slug: slug,
      description: description,
      quantity: quantity,
      price: price,
      imageCover: imageCover,
      category: category?.toProductCategory(),
      brand: brand?.toProductBrand(),
      ratingsAverage: ratingsAverage,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
