part of '../product_usecase.dart';

extension GetProductsInBasketReaction on ProductUseCase {
  Future<BasketEntity> _getProductsInBasketReaction() async {
    final basket = <Bag>[];

    final data = await productRepository.getProductsInBasket();

    for (var element in data.basket) {
      basket.add(Bag(
        id: element.id,
        images: element.images,
        price: element.price.toDoublePrice,
        title: element.title,
      ));
    }

    final BasketEntity basketEntity = BasketEntity(
      basket: basket,
      delivery: data.delivery,
      id: data.id,
      total: data.total.toIntPrice,
    );

    return basketEntity;
  }
}
