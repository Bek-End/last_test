import 'package:equatable/equatable.dart';

class BasketEntity with EquatableMixin {
  BasketEntity({
    required this.basket,
    required this.delivery,
    required this.id,
    required this.total,
  });

  final List<Bag> basket;
  final String delivery;
  final String id;
  final String total;

  @override
  List<Object?> get props => [id, basket, delivery, total];
}

class Bag with EquatableMixin{
  Bag({
    required this.id,
    required this.images,
    required this.price,
    required this.title,
  });

  final int id;
  final String images;
  final String price;
  final String title;

  @override
  List<Object?> get props => [id, images, price, title];
}
