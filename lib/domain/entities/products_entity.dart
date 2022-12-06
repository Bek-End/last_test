import 'package:equatable/equatable.dart';

class ProductsEntity with EquatableMixin {
  ProductsEntity({
    required this.homeStore,
    required this.bestSeller,
  });

  final List<HomeStoreEntity> homeStore;
  final List<BestSellerEntity> bestSeller;

  @override
  List<Object?> get props => [homeStore, bestSeller];
}

class BestSellerEntity with EquatableMixin {
  BestSellerEntity({
    required this.id,
    required this.isFavorites,
    required this.title,
    required this.priceWithoutDiscount,
    required this.discountPrice,
    required this.picture,
  });

  final int id;
  final bool isFavorites;
  final String title;
  final String priceWithoutDiscount;
  final String discountPrice;
  final String picture;

  @override
  List<Object?> get props => [id, isFavorites, title, priceWithoutDiscount, picture, discountPrice];
}

class HomeStoreEntity with EquatableMixin {
  HomeStoreEntity({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.picture,
    required this.isBuy,
    this.isNew,
  });

  final int id;
  final bool? isNew;
  final String title;
  final String subtitle;
  final String picture;
  final bool isBuy;

  @override
  List<Object?> get props => [id, isNew, title, subtitle, picture, isBuy];
}
