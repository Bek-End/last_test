import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:last_test/config/constants/assets.dart';
import 'package:last_test/config/theme/app_theme.dart';
import 'package:last_test/domain/entities/basket_entity.dart';
import 'package:last_test/presentation/screens/basket/bloc/basket_bloc.dart';
import 'package:last_test/presentation/widgets/custom_button.dart';
import 'package:last_test/presentation/widgets/custom_icon_button.dart';
import 'package:last_test/presentation/widgets/loading.dart';

class BasketScreen extends StatelessWidget {
  const BasketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _AppBar(),
          Padding(
            padding: const EdgeInsets.fromLTRB(42, 50, 0, 49),
            child: Text(
              'My Cart',
              style: appTheme.textTheme.h2.copyWith(fontSize: 35),
            ),
          ),
          const Expanded(
            child: _ProductsInBasket(),
          )
        ],
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar();

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(42, 79, 35, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomIconButton(
            icon: Assets.icons.arrowBack,
            onTap: () => Navigator.pop(context),
            colorButton: appTheme.colorsScheme.darkBlue,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Add address',
                style: appTheme.textTheme.h3,
              ),
              const SizedBox(width: 9),
              CustomIconButton(
                icon: Assets.icons.location,
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ProductsInBasket extends StatelessWidget {
  const _ProductsInBasket();

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);
    final colorsScheme = appTheme.colorsScheme;
    final textTheme = appTheme.textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30),
      decoration: BoxDecoration(
        color: colorsScheme.darkBlue,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -5),
            blurRadius: 20,
            color: colorsScheme.shadow.withOpacity(0.1),
          ),
        ],
      ),
      child: BlocBuilder<BasketBloc, BasketState>(
        builder: (_, state) {
          if (state is BasketProductsState) {
            final basket = state.myBasket.basket;
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: basket.length,
                    padding: const EdgeInsets.all(30),
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (_, index) {
                      final product = basket[index];
                      return _ProductItem(product: product);
                    },
                  ),
                ),
                const _Divider(),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.only(left: 55, right: 35),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total',
                            style: textTheme.h4.copyWith(
                              color: colorsScheme.white,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'Delivery',
                            style: textTheme.h4.copyWith(
                              color: colorsScheme.white,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '\$${state.myBasket.total} us',
                            style: textTheme.h2.copyWith(color: colorsScheme.white),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            state.myBasket.delivery,
                            style: textTheme.h2.copyWith(color: colorsScheme.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 26),
                const _Divider(),
                const SizedBox(height: 41),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: CustomButton(
                    text: 'Checkout',
                    textStyle: textTheme.h2.copyWith(
                      color: colorsScheme.white,
                      fontSize: 20,
                    ),
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    onTap: () {},
                  ),
                ),
              ],
            );
          }
          return const Loading();
        },
      ),
    );
  }
}

class _ProductItem extends StatelessWidget {
  final Bag product;
  const _ProductItem({required this.product});

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);
    final style = appTheme.textTheme.h3.copyWith(fontSize: 20);
    final colorsScheme = appTheme.colorsScheme;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 23),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              product.images,
              width: 88,
              height: 88,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.visible,
                  style: style.copyWith(color: colorsScheme.white),
                ),
                const SizedBox(height: 6),
                Text(
                  '\$${product.price}',
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.visible,
                  style: style.copyWith(color: colorsScheme.white),
                )
              ],
            ),
          ),
          const _Counter(count: 2),
          SvgPicture.asset(Assets.icons.trash),
        ],
      ),
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 2,
      width: MediaQuery.of(context).size.width,
      color: AppTheme.of(context).colorsScheme.white.withOpacity(0.25),
    );
  }
}

class _Counter extends StatefulWidget {
  final int count;
  const _Counter({
    required this.count,
  });

  @override
  State<_Counter> createState() => _CounterState();
}

class _CounterState extends State<_Counter> {
  late int _count;

  @override
  void initState() {
    super.initState();
    _count = widget.count;
  }

  void _decrement() {
    _count--;
    if (_count < 0) _count = 0;
    setState(() {});
  }

  void _increment() {
    _count++;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);
    final colorsScheme = appTheme.colorsScheme;
    final style = appTheme.textTheme.h3.copyWith(
      fontSize: 20,
      color: colorsScheme.white,
    );
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.symmetric(horizontal: 17),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26),
        color: colorsScheme.lightBlue,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: _decrement,
            child: Text('-', style: style),
          ),
          Text(_count.toString(), style: style),
          InkWell(
            onTap: _increment,
            child: Text('+', style: style),
          ),
        ],
      ),
    );
  }
}
