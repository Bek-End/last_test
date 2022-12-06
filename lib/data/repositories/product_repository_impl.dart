import 'package:last_test/data/models/product_details_model.dart';
import 'package:last_test/data/models/basket_model.dart';
import 'package:last_test/data/models/products_model.dart';
import 'package:last_test/data/network/api_service.dart';
import 'package:last_test/domain/repositories/product_repository.dart';

class ProductRepositoryImpl extends ProductRepository {
  final ApiService apiService;
  ProductRepositoryImpl(this.apiService);

  @override
  Future<ProductsModel> getProducts() async{
    return await apiService.getProducts();
  }

  @override
  Future<ProductDetailsModel> getProductDetail() async {
    return await apiService.getProductDetail();
  }

  @override
  Future<BasketModel> getProductsInBasket() async{
    return await apiService.getProductsInBasket();
  }
}
