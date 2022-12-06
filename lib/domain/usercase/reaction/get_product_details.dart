part of '../product_usecase.dart';

extension GetProductDetailReaction on ProductUseCase {
  Future<ProductDetailsEntity> _getProductDetailReaction() async {
    final productModel = await productRepository.getProductDetail();

    final ProductDetailsEntity productDetailsEntity = ProductDetailsEntity(
      id: productModel.id,
      images: productModel.images,
      title: productModel.title,
      isFavorites: productModel.isFavorites,
      rating: productModel.rating,
      price: productModel.price.toDoublePrice,
      camera: productModel.camera,
      capacity: productModel.capacity.map((e) => '$e gb').toList(),
      color: productModel.color.map((e) => int.parse('0xFF${e.substring(1)}')).toList(),
      cpu: productModel.cpu,
      sd: productModel.sd,
      ssd: productModel.ssd,
    );

    return productDetailsEntity;
  }
}
