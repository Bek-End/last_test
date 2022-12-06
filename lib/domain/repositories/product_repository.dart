import 'package:last_test/data/models/basket_model.dart';
import 'package:last_test/data/models/product_details_model.dart';
import 'package:last_test/data/models/products_model.dart';

abstract class ProductRepository {
  Future<ProductsModel> getProducts();
  Future<ProductDetailsModel> getProductDetail();
  Future<BasketModel> getProductsInBasket();
}
