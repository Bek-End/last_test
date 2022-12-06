import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:last_test/config/constants/assets.dart';
import 'package:last_test/config/theme/app_theme.dart';
import 'package:last_test/domain/entities/products_entity.dart';
import 'package:last_test/presentation/screens/product/bloc/product_bloc.dart';
import 'package:last_test/presentation/screens/product/product_detail.dart';
import 'package:last_test/presentation/widgets/circle_icon_button.dart';
import 'package:last_test/presentation/widgets/custom_button.dart';
import 'package:last_test/presentation/widgets/custom_icon_button.dart';
import 'package:last_test/presentation/widgets/custom_text_field.dart';
import 'package:last_test/presentation/widgets/loading.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void filterBottomSheet() async {
      final homeBloc = BlocProvider.of<ProductBloc>(context, listen: false);
      final data = await showModalBottomSheet<dynamic>(
        context: context,
        builder: (_) => const _FilterBottomSheet(),
      );
      homeBloc.add(ProductFilterEvent(data.toString()));
    }

    return BlocConsumer<ProductBloc, ProductState>(
      listener: (context, state) {
        if (state is ProductDetailState) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => ProductDetailScreen(product: state.productDetails),
          ));
        }
      },
      builder: (_, state) {
        if (state is ProductAllState) {
          return Scaffold(
            appBar: AppBar(
              title: const _AppBarTitle(),
              actions: [
                GestureDetector(
                  onTap: filterBottomSheet,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 35),
                    child: SvgPicture.asset(
                      Assets.icons.filter,
                      color: AppTheme.of(context).colorsScheme.darkBlue,
                    ),
                  ),
                ),
              ],
            ),
            body: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 17),
                  child: _SectionTitle(
                    title: 'Select Category',
                    action: 'view all',
                  ),
                ),
                const SizedBox(height: 24),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxHeight: 100),
                  child: const _CheckCategory(),
                ),
                const SizedBox(height: 35),
                const Padding(
                  padding: EdgeInsets.only(left: 32, right: 20),
                  child: _SearchFilter(),
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 17),
                    physics: const BouncingScrollPhysics(),
                    children: [
                      const _SectionTitle(title: 'Hot sales', action: 'see more'),
                      const SizedBox(height: 8),
                      const _HotSales(),
                      const SizedBox(height: 11),
                      const _SectionTitle(title: 'Best Seller', action: 'see more'),
                      const SizedBox(height: 4),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 2,
                        child: const _GridProducts(),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        }
        return const Loading();
      },
    );
  }
}

class _AppBarTitle extends StatelessWidget {
  const _AppBarTitle();

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);
    final colorsScheme = appTheme.colorsScheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          Assets.icons.location,
          color: colorsScheme.orange,
        ),
        const SizedBox(width: 11),
        Text(
          'Zihuatanejo, Gro',
          style: appTheme.textTheme.h3.copyWith(fontSize: 15),
        ),
        const SizedBox(width: 8),
        SvgPicture.asset(
          Assets.icons.arrowDown,
          color: colorsScheme.grey,
        ),
      ],
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  final String action;
  const _SectionTitle({
    required this.title,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTheme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: textTheme.h2.copyWith(fontSize: 25),
        ),
        TextButton(
          onPressed: null,
          child: Text(action),
        )
      ],
    );
  }
}

class _CheckCategory extends StatelessWidget {
  const _CheckCategory();

  @override
  Widget build(BuildContext context) {
    final categoryTitles = ['Phones', 'Computer', 'Health', 'Books'];

    final categoryIcons = [
      Assets.icons.phone,
      Assets.icons.computer,
      Assets.icons.health,
      Assets.icons.books,
    ];

    return BlocBuilder<ProductBloc, ProductState>(
      builder: (_, state) {
        if (state is ProductAllState) {
          return ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 17),
            children: List.generate(
              4,
              (index) => _CategoryItem(
                title: categoryTitles[index],
                icon: categoryIcons[index],
                isSelected: state.categoryIndex == index,
                onTap: () => context.read<ProductBloc>().add(ProductChangeCategoryEvent(index)),
              ),
            ),
          );
        }
        return SizedBox.fromSize();
      },
    );
  }
}

class _CategoryItem extends StatelessWidget {
  final String title;
  final String icon;
  final bool isSelected;
  final VoidCallback onTap;
  const _CategoryItem({
    required this.title,
    required this.icon,
    required this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);
    final colorsScheme = appTheme.colorsScheme;

    final containerColor = isSelected ? colorsScheme.orange : colorsScheme.white;
    final textColor = isSelected ? colorsScheme.orange : colorsScheme.darkBlue;
    final iconColor = isSelected ? colorsScheme.white : colorsScheme.darkBlue.withOpacity(0.3);

    return Column(
      children: [
        CircleIconButton(
          icon: icon,
          buttonColor: containerColor,
          iconColor: iconColor,
          width: 71,
          height: 71,
          onTap: onTap,
        ),
        const SizedBox(height: 7),
        Text(
          title,
          style: appTheme.textTheme.h3.copyWith(
            fontSize: 12,
            color: textColor,
          ),
        )
      ],
    );
  }
}

class _SearchFilter extends StatefulWidget {
  const _SearchFilter();

  @override
  State<_SearchFilter> createState() => _SearchFilterState();
}

class _SearchFilterState extends State<_SearchFilter> {
  late final TextEditingController _controller = TextEditingController()..addListener(_listen);

  void _listen() {
    context.read<ProductBloc>().add(ProductFilterEvent(_controller.text));
  }

  @override
  Widget build(BuildContext context) {
    final colorsScheme = AppTheme.of(context).colorsScheme;
    return Row(
      children: [
        Expanded(
          child: CustomTextField(
            hintText: 'Search',
            controller: _controller,
            prefixIcon: Assets.icons.search,
          ),
        ),
        CircleIconButton(
          icon: Assets.icons.grid,
          buttonColor: colorsScheme.orange,
          iconColor: colorsScheme.white,
          width: 34,
          height: 34,
          onTap: () {},
        ),
      ],
    );
  }
}

class _HotSales extends StatelessWidget {
  const _HotSales();

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);
    final colorsScheme = appTheme.colorsScheme;
    final textTheme = appTheme.textTheme;
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (_, state) {
        if (state is ProductAllState) {
          final homeStores = state.products.homeStore;
          return SizedBox(
            height: 182,
            child: PageView.builder(
              itemCount: homeStores.length,
              itemBuilder: (_, index) {
                final homeStore = homeStores[index];
                return Container(
                  padding: const EdgeInsets.only(left: 25, top: 14),
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(homeStore.picture),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (homeStore.isNew == true)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 4,
                            vertical: 7,
                          ),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: colorsScheme.orange,
                          ),
                          child: Text(
                            'New',
                            style: textTheme.h2.copyWith(
                              color: colorsScheme.white,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      const SizedBox(height: 18),
                      Text(
                        homeStore.title,
                        style: textTheme.h2.copyWith(
                          color: colorsScheme.white,
                          fontSize: 25,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        homeStore.subtitle,
                        style: textTheme.h4.copyWith(color: colorsScheme.white),
                      ),
                      const SizedBox(height: 5),
                      CustomButton(
                        text: 'Buy now!',
                        textStyle: textTheme.h2.copyWith(fontSize: 11),
                        color: colorsScheme.white,
                        borderRadius: 5,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 27,
                          vertical: 5,
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        }
        return SizedBox.fromSize();
      },
    );
  }
}

class _GridProducts extends StatelessWidget {
  const _GridProducts();

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (_, state) {
        if (state is ProductAllState) {
          final bestSellers = state.products.bestSeller;
          return GridView.builder(
            padding: const EdgeInsets.symmetric(vertical: 12),
            itemCount: bestSellers.length,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3,
              crossAxisSpacing: 14,
              mainAxisSpacing: 12,
              childAspectRatio: 0.8,
            ),
            itemBuilder: (_, index) {
              final bestSeller = bestSellers[index];
              return _GridItemProduct(product: bestSeller);
            },
          );
        }
        return const Loading();
      },
    );
  }
}

class _GridItemProduct extends StatelessWidget {
  final BestSellerEntity product;
  const _GridItemProduct({
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);
    final colorsScheme = appTheme.colorsScheme;
    final textTheme = appTheme.textTheme;
    return Stack(
      children: [
        GestureDetector(
          onTap: () => context.read<ProductBloc>().add(ProductDetailEvent()),
          child: Container(
            decoration: BoxDecoration(
              color: colorsScheme.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  blurRadius: 40,
                  color: colorsScheme.shadow.withOpacity(0.1),
                )
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  product.picture,
                  height: 168,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) {
                    return SizedBox(
                      height: 168,
                      child: Center(
                        child: Icon(
                          Icons.photo_outlined,
                          color: colorsScheme.grey,
                        ),
                      ),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 21.0),
                  child: Row(
                    children: [
                      Text(
                        '\$${product.discountPrice}',
                        style: textTheme.h2,
                      ),
                      const SizedBox(width: 7),
                      Text(
                        '\$${product.priceWithoutDiscount}',
                        style: textTheme.h3.copyWith(
                          fontSize: 10,
                          color: colorsScheme.lightGrey,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.only(left: 21.0),
                  child: Text(
                    product.title,
                    style: textTheme.h4,
                  ),
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
        ),
        Positioned(
          top: 11,
          right: 16,
          child: InkWell(
            onTap: () => context.read<ProductBloc>().add(ProductChangeFavoriteStatusEvent(product.id)),
            child: Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colorsScheme.white,
              ),
              child: Center(
                child: SvgPicture.asset(
                  product.isFavorites ? Assets.icons.heart : Assets.icons.heartRounded,
                  color: colorsScheme.red,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class _FilterBottomSheet extends StatelessWidget {
  const _FilterBottomSheet();

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);
    final colorsScheme = appTheme.colorsScheme;
    final textTheme = appTheme.textTheme;
    final style18s500w = textTheme.h3;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
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
              CustomIconButton(
                icon: Assets.icons.close,
                colorButton: colorsScheme.darkBlue,
                onTap: () => Navigator.of(context).pop(null),
              ),
              Text(
                'Filter options',
                style: textTheme.h3,
              ),
              CustomButton(
                text: 'Done',
                textStyle: style18s500w.copyWith(color: colorsScheme.white),
                padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 20),
                onTap: () => Navigator.of(context).pop('data'),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Text('Brand', style: style18s500w),
          const SizedBox(height: 10),
          const _Popup(value: 'Samsung'),
          const SizedBox(height: 15),
          Text('Price', style: style18s500w),
          const SizedBox(height: 10),
          const _Popup(value: '\$300 - \$500'),
          const SizedBox(height: 15),
          Text('Size', style: style18s500w),
          const SizedBox(height: 10),
          const _Popup(value: '4.5 to 5.5 inches')
        ],
      ),
    );
  }
}

class _Popup extends StatelessWidget {
  final String value;
  const _Popup({
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: appTheme.colorsScheme.grey),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            value,
            style: appTheme.textTheme.h4.copyWith(fontSize: 18),
          ),
          PopupMenuButton<String>(
            initialValue: value,
            padding: const EdgeInsets.all(0),
            icon: SvgPicture.asset(
              Assets.icons.arrowDown,
              width: 16,
              height: 8,
            ),
            constraints: const BoxConstraints(maxHeight: 50),
            itemBuilder: (_) => <PopupMenuEntry<String>>[],
          ),
        ],
      ),
    );
  }
}
