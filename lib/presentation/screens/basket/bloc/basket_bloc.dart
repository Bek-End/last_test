import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:last_test/domain/entities/basket_entity.dart';
import 'package:last_test/domain/usercase/product_usecase.dart';

class BasketBloc extends Bloc<BasketEvent, BasketState> {
  BasketBloc() : super(BasketLoadingState()) {
    final ProductUseCase productUseCase = GetIt.I.get();

    on<BasketProductsEvent>((event, emit) async {
      final basket = await productUseCase.getProductsInBasket();
      emit(BasketProductsState(basket));
    });
  }
}

abstract class BasketEvent {}

class BasketProductsEvent extends BasketEvent {}

abstract class BasketState {}

class BasketLoadingState extends BasketState {}

class BasketProductsState extends BasketState {
  final BasketEntity myBasket;
  BasketProductsState(this.myBasket);
}
