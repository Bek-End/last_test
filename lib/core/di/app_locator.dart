import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:last_test/data/network/api_service.dart';
import 'package:last_test/data/repositories/product_repository_impl.dart';
import 'package:last_test/domain/repositories/product_repository.dart';
import 'package:last_test/domain/usercase/product_usecase.dart';

class AppLocator {
  static void init() {
    final getIt = GetIt.I;

    getIt.registerSingleton<ApiService>(_getApiService());
    getIt.registerSingleton<ProductRepository>(ProductRepositoryImpl(getIt.get()));
    getIt.registerSingleton<ProductUseCase>(ProductUseCase());
  }

  static Future<void> dispose() async {
    return GetIt.I.reset();
  }
}

ApiService _getApiService() {
  return ApiService(Dio());
}
