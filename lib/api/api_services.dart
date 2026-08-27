import 'package:dio/dio.dart';
import 'package:ecommerce/api/model/request/register_request_dto.dart';
import 'package:ecommerce/api/model/response/Brands/brand_response_dto.dart';
import 'package:ecommerce/api/model/response/Category/category_response_dto.dart';
import 'package:ecommerce/api/model/response/cart/add_to_cart_response_dto.dart';
import 'package:ecommerce/api/model/response/cart/get_cart/get_cart_response_dto.dart';
import 'package:ecommerce/api/model/response/product/product_response_dto.dart';
import 'package:ecommerce/api/model/response/product_details/product_details_response_dto.dart';
import 'package:retrofit/retrofit.dart';

import 'api_endpoint.dart';
import 'model/request/cart/add_to_cart_request_dto.dart';
import 'model/request/cart/count_request_dto.dart';
import 'model/request/login_request_dto.dart';
import 'model/response/auth_response_dto.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: ApiEndpoint.BaseUrl)
abstract class ApiServices {
  factory ApiServices(Dio dio, {String? baseUrl}) = _ApiServices;

  // =========================
  // AUTH
  // =========================

  @POST(ApiEndpoint.LoginApi)
  Future<AuthResponseDto> login(@Body() LoginRequestDto loginRequestDto);

  @POST(ApiEndpoint.RegisterApi)
  Future<AuthResponseDto> Register(
    @Body() RegisterRequestDto rgisterRequestDto,
  );

  // =========================
  // CATEGORY
  // =========================

  @GET(ApiEndpoint.CategoryApi)
  Future<CategoryResponseDto> getAllCategories();

  // =========================
  // BRAND
  // =========================

  @GET(ApiEndpoint.BrandApi)
  Future<BrandsResponseDto> getAllBrands();

  // =========================
  // PRODUCT
  // =========================

  @GET(ApiEndpoint.ProductApi)
  Future<ProductResponseDto> getAllProducts();

  @GET('${ApiEndpoint.ProductApi}/{id}')
  Future<ProductDetailsResponseDto> getProductDetails(@Path('id') String id);

  // =========================
  // CART
  // =========================

  // POST /api/v1/cart
  // Add product to cart

  @POST(ApiEndpoint.CartApi)
  Future<AddToCartResponseDto> addToCart(
    @Body() AddToCartRequestDto addToCartRequestDto,
    @Header('token') String token,
  );

  // =========================
  // GET CART
  // =========================

  // GET /api/v1/cart
  // Get logged user cart

  @GET(ApiEndpoint.CartApi)
  Future<GetCartResponseDto> geitemsIntCart(@Header('token') String token);

  // =========================
  // DELETE CART ITEM
  // =========================

  // DELETE /api/v1/cart/{cartItemId}
  // Delete ONE item from cart

  @DELETE(ApiEndpoint.DeleteItemInCartApi)
  Future<GetCartResponseDto> deleteItemsIntCart(
    @Path('cartItemId') String cartItemId,
    @Header('token') String token,
  );

  // =========================
  // UPDATE CART ITEM
  // =========================

  // PUT /api/v1/cart/{cartItemId}
  // Update quantity of ONE item

  @PUT(ApiEndpoint.UpdateItemInCartApi)
  Future<GetCartResponseDto> UpdateCountIntCart(
    @Path('cartItemId') String cartItemId,
    @Header('token') String token,
    @Body() CountRequestDto countRequestDto,
  );
}
