import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:last_test/presentation/screens/basket/bloc/basket_bloc.dart';
import 'package:last_test/presentation/screens/product/bloc/product_bloc.dart';
import 'package:last_test/presentation/screens/splash/bloc/splash_bloc.dart';

class BlocScope extends StatefulWidget {
  final Widget? child;

  const BlocScope({
    this.child,
    Key? key,
  }) : super(key: key);

  @override
  State<BlocScope> createState() => _BlocScopeState();
}

class _BlocScopeState extends State<BlocScope> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SplashBloc()..add(ShowProductEvent())),
        BlocProvider(create: (context) => ProductBloc()..add(ProductAllEvent())),
        BlocProvider(create: (context) => BasketBloc()..add(BasketProductsEvent())),
      ],
      child: widget.child ?? const SizedBox.shrink(),
    );
  }
}
