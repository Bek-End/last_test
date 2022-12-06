import 'package:get_it/get_it.dart';
import 'package:last_test/core/extensions/price_extensions.dart';
import 'package:last_test/domain/entities/basket_entity.dart';
import 'package:last_test/domain/entities/product_details_entity.dart';
import 'package:last_test/domain/entities/products_entity.dart';
import 'package:last_test/domain/repositories/product_repository.dart';

part 'reaction/get_products_in_basket.dart';
part 'reaction/get_product_details.dart';
part 'reaction/get_products.dart';

class ProductUseCase {
  final ProductRepository productRepository = GetIt.I.get();

  Future<ProductsEntity> getProducts() async => _getProductsReaction();
  Future<ProductDetailsEntity> getProductDetail() async => _getProductDetailReaction();
  Future<BasketEntity> getProductsInBasket() async => _getProductsInBasketReaction();
}
