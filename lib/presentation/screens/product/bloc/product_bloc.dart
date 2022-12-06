import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:last_test/domain/entities/product_details_entity.dart';
import 'package:last_test/domain/entities/products_entity.dart';
import 'package:last_test/domain/usercase/product_usecase.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductLoadingState()) {
    final ProductUseCase productUseCase = GetIt.I.get();
    ProductsEntity? cacheProducts;

    on<ProductAllEvent>((event, emit) async {
      final products = cacheProducts ?? await productUseCase.getProducts();
      cacheProducts = products;
      emit(ProductAllState(products, 0));
    });

    on<ProductChangeCategoryEvent>((event, emit) async {
      emit(ProductAllState(cacheProducts!, event.categoryIndex));
    });

    on<ProductDetailEvent>((event, emit) async {
      final product = await productUseCase.getProductDetail();
      emit(ProductDetailState(product));
    });

    on<ProductChangeFavoriteStatusEvent>((event, emit) async {
      return emit(state);
    });

    on<ProductFilterEvent>((event, emit) async {
      return emit(state);
    });
  }
}

abstract class ProductEvent {}

class ProductAllEvent extends ProductEvent {}

class ProductChangeCategoryEvent extends ProductEvent {
  final int categoryIndex;
  ProductChangeCategoryEvent(this.categoryIndex);
}

class ProductChangeFavoriteStatusEvent extends ProductEvent {
  final int idProduct;
  ProductChangeFavoriteStatusEvent(this.idProduct);
}

class ProductFilterEvent extends ProductEvent {
  final String data;
  ProductFilterEvent(this.data);
}

class ProductDetailEvent extends ProductEvent {}

abstract class ProductState {}

class ProductLoadingState extends ProductState {}

class ProductAllState extends ProductState {
  final ProductsEntity products;
  final int categoryIndex;
  ProductAllState(this.products, this.categoryIndex);
}

class ProductDetailState extends ProductState {
  final ProductDetailsEntity productDetails;
  ProductDetailState(this.productDetails);
}
