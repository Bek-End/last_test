import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:last_test/config/constants/assets.dart';
import 'package:last_test/config/theme/app_theme.dart';
import 'package:last_test/domain/entities/product_details_entity.dart';
import 'package:last_test/presentation/screens/basket/basket_screen.dart';
import 'package:last_test/presentation/screens/product/bloc/product_bloc.dart';
import 'package:last_test/presentation/widgets/custom_button.dart';
import 'package:last_test/presentation/widgets/custom_icon_button.dart';
import 'package:last_test/presentation/widgets/loading.dart';

class ProductDetailScreen extends StatelessWidget {
  final ProductDetailsEntity product;
  const ProductDetailScreen({
    required this.product,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.read<ProductBloc>().add(ProductAllEvent());
        return false;
      },
      child: Scaffold(
        body: BlocConsumer<ProductBloc, ProductState>(
          listener: (context, state) {
            if (state is ProductAllState) Navigator.pop(context);
          },
          builder: (context, state) {
            if (state is ProductDetailState) {
              return Column(
                children: [
                  const _AppBar(),
                  Expanded(
                    child: _ImagePage(product: product),
                  ),
                  _DetailInfo(product: product),
                ],
              );
            }
            return const Loading();
          },
        ),
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar();

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);
    final colorsScheme = appTheme.colorsScheme;
    return Padding(
      padding: const EdgeInsets.fromLTRB(42, 79, 35, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomIconButton(
            icon: Assets.icons.arrowBack,
            onTap: () => context.read<ProductBloc>().add(ProductAllEvent()),
            colorButton: colorsScheme.darkBlue,
          ),
          Text(
            'Product Details',
            style: appTheme.textTheme.h3,
          ),
          CustomIconButton(
            icon: Assets.icons.basket,
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => const BasketScreen(),
              ));
            },
          ),
        ],
      ),
    );
  }
}

class _ImagePage extends StatefulWidget {
  final ProductDetailsEntity product;
  const _ImagePage({
    required this.product,
  });

  @override
  State<_ImagePage> createState() => _ImagePageState();
}

class _ImagePageState extends State<_ImagePage> {
  int _currentIndex = 0;
  final _controller = PageController(
    initialPage: 0,
    viewportFraction: 0.7,
  );

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);
    final colorsScheme = appTheme.colorsScheme;
    return PageView.builder(
      itemCount: widget.product.images.length,
      controller: _controller,
      onPageChanged: (index) => setState(() {
        _currentIndex = index;
      }),
      itemBuilder: (_, index) {
        double scale = _currentIndex == index ? 1.0 : 0.8;
        return TweenAnimationBuilder(
          tween: Tween(begin: scale, end: scale),
          duration: const Duration(milliseconds: 250),
          child: Container(
            margin: const EdgeInsets.fromLTRB(16, 30, 16, 14),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(widget.product.images[index]),
                fit: BoxFit.cover,
                onError: (_, __) => const Icon(Icons.photo_rounded),
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 10),
                  color: colorsScheme.shadow,
                  blurRadius: 20,
                ),
              ],
            ),
          ),
          builder: (_, value, child) {
            return Transform.scale(
              scale: value,
              child: child,
            );
          },
        );
      },
    );
  }
}

class _DetailInfo extends StatelessWidget {
  final ProductDetailsEntity product;
  const _DetailInfo({
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);
    final colorsScheme = appTheme.colorsScheme;
    final textTheme = appTheme.textTheme;
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: colorsScheme.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -5),
            blurRadius: 20,
            color: colorsScheme.shadow,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                product.title,
                style: textTheme.h3,
              ),
              CustomIconButton(
                icon: Assets.icons.heartRounded,
                colorButton: colorsScheme.darkBlue,
                onTap: () {},
              ),
            ],
          ),
          Row(
            children: List.generate(
              product.rating.ceil(),
              (index) => SvgPicture.asset(Assets.icons.star),
            ),
          ),
          const SizedBox(height: 32),
          DefaultTabController(
            length: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TabBar(tabs: [
                  Text('Shop'),
                  Text('Details'),
                  Text('Features'),
                ]),
                const SizedBox(height: 33),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _Details(icon: Assets.icons.cpu, detailName: product.cpu),
                    _Details(
                        icon: Assets.icons.camera, detailName: product.camera),
                    _Details(icon: Assets.icons.ssd, detailName: product.ssd),
                    _Details(icon: Assets.icons.sd, detailName: product.sd),
                  ],
                ),
                const SizedBox(height: 29),
                Text(
                  'Select color and capacity',
                  style: textTheme.h3.copyWith(fontSize: 16),
                ),
                const SizedBox(height: 14),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _ProductColors(product: product),
                    _ProductCapacities(product: product),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 27),
          CustomButton(
            text: 'Add to Cart    \$${product.price}',
            textStyle: textTheme.h2.copyWith(
              color: colorsScheme.white,
              fontSize: 20,
            ),
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(vertical: 14),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class _Details extends StatelessWidget {
  final String icon;
  final String detailName;
  const _Details({
    required this.icon,
    required this.detailName,
  });

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);
    final style =
        appTheme.textTheme.h4.copyWith(color: appTheme.colorsScheme.grey);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(icon),
        const SizedBox(height: 5),
        Text(detailName, style: style),
      ],
    );
  }
}

class _ProductColors extends StatefulWidget {
  final ProductDetailsEntity product;
  const _ProductColors({
    required this.product,
  });

  @override
  State<_ProductColors> createState() => _ProductColorsState();
}

class _ProductColorsState extends State<_ProductColors> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    final colors = widget.product.color;
    return Row(
      children: List.generate(
        widget.product.color.length,
        (index) => GestureDetector(
          onTap: () => setState(() => _index = index),
          child: Container(
            width: 40,
            height: 40,
            margin: EdgeInsets.only(
                right: (index != colors.length - 1) ? 17.75 : 0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(colors[index]),
            ),
            child: Center(
              child: _index == index
                  ? SvgPicture.asset(Assets.icons.check)
                  : const SizedBox.shrink(),
            ),
          ),
        ),
      ),
    );
  }
}

class _ProductCapacities extends StatefulWidget {
  final ProductDetailsEntity product;
  const _ProductCapacities({
    required this.product,
  });

  @override
  State<_ProductCapacities> createState() => _ProductCapacitiesState();
}

class _ProductCapacitiesState extends State<_ProductCapacities> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    final capacities = widget.product.capacity;
    final appTheme = AppTheme.of(context);
    return Row(
      children: List.generate(
        widget.product.capacity.length,
        (index) => _index == index
            ? Padding(
                padding: EdgeInsets.only(
                    right: (index != capacities.length - 1) ? 20 : 0),
                child: CustomButton(
                  text: capacities[index].toUpperCase(),
                  textStyle: appTheme.textTheme.h2.copyWith(
                    fontSize: 13,
                    color: appTheme.colorsScheme.white,
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                  onTap: () {},
                ),
              )
            : Padding(
                padding: const EdgeInsets.only(right: 20),
                child: GestureDetector(
                  onTap: () => setState(() => _index = index),
                  child: Text(
                    capacities[index],
                    style: appTheme.textTheme.h2.copyWith(
                      fontSize: 13,
                      color: appTheme.colorsScheme.grey,
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
