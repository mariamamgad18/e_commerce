import 'package:ecommerce/Domain/entities/response/product/product_data.dart';

import '../common/metadata.dart';

class ProductResponse {
  final int? results;

  final Metadata? metadata;

  final List<ProductData>? data;

  ProductResponse({this.results, this.metadata, this.data});
}
