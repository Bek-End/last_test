part of '../product_usecase.dart';

extension GetProductsReaction on ProductUseCase {
  Future<ProductsEntity> _getProductsReaction() async {
    final bestSellers = <BestSellerEntity>[];
    final homeStores = <HomeStoreEntity>[];

    final productModel = await productRepository.getProducts();

    for (var element in productModel.bestSeller) {
      bestSellers.add(BestSellerEntity(
        id: element.id,
        isFavorites: element.isFavorites,
        title: element.title,
        priceWithoutDiscount: element.priceWithoutDiscount.toIntPrice,
        discountPrice: element.discountPrice.toIntPrice,
        picture: element.picture,
      ));
    }

    for (var element in productModel.homeStore) {
      homeStores.add(HomeStoreEntity(
        id: element.id,
        isNew: element.isNew,
        title: element.title,
        subtitle: element.subtitle,
        picture: element.picture,
        isBuy: element.isBuy,
      ));
    }

    final ProductsEntity productsEntity = ProductsEntity(
      homeStore: homeStores,
      bestSeller: bestSellers,
    );

    return productsEntity;
  }
}
