import 'package:dio/dio.dart';
import 'package:last_test/core/show_error.dart';
import 'package:last_test/data/models/basket_model.dart';
import 'package:last_test/data/models/product_details_model.dart';
import 'package:last_test/data/models/products_model.dart';
import 'package:retrofit/http.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: 'https://run.mocky.io')
abstract class ApiService {
  factory ApiService(Dio dio, {String? baseUrl}) {
    dio.interceptors.add(InterceptorsWrapper(
      onError: (e, _) => showError(e.error.toString()),
    ));
    return _ApiService(dio, baseUrl: baseUrl);
  }

  @GET('/v3/654bd15e-b121-49ba-a588-960956b15175')
  Future<ProductsModel> getProducts();

  @GET('/v3/6c14c560-15c6-4248-b9d2-b4508df7d4f5')
  Future<ProductDetailsModel> getProductDetail();

  @GET('/v3/53539a72-3c5f-4f30-bbb1-6ca10d42c149')
  Future<BasketModel> getProductsInBasket();
}
