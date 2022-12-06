import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:last_test/config/constants/app_colors.dart';
import 'package:last_test/config/constants/assets.dart';
import 'package:last_test/config/theme/app_theme.dart';
import 'package:last_test/presentation/screens/basket/bloc/basket_bloc.dart';

import 'basket/basket_screen2.dart';
import 'favorite_product/favorite_product.dart';
import 'product/product_screen.dart';
import 'profile/profile_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    ProductScreen(),
    BasketScreen2(),
    FavoriteProductScreen(),
    ProfileScreen(),
  ];

  final List<Widget> _icons = <Widget>[
    const Icon(Icons.home, color: AppColors.white),
    SvgPicture.asset(Assets.icons.basket),
    SvgPicture.asset(Assets.icons.heartRounded),
    SvgPicture.asset(Assets.icons.person),
  ];

  final List<String> _labels = <String>[
    'Explorer',
    'Basket',
    'Favorite',
    'Profile',
  ];

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);
    final colorsScheme = appTheme.colorsScheme;
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: Container(
        height: 72,
        decoration: BoxDecoration(
          color: colorsScheme.darkBlue,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            4,
            (index) => BlocBuilder<BasketBloc, BasketState>(
              builder: (_, state) {
                if (state is BasketProductsState && index == 1 && _selectedIndex != 1) {
                  return Badge(
                    toAnimate: false,
                    badgeContent: Text(
                      state.myBasket.basket.length.toString(),
                      style: appTheme.textTheme.h4.copyWith(color: colorsScheme.white),
                    ),
                    child: _BottomItemBar(
                      showIcon: _selectedIndex != index,
                      icon: _icons[index],
                      label: _labels[index],
                      onTap: () => setState(() => _selectedIndex = index),
                    ),
                  );
                }
                return _BottomItemBar(
                  showIcon: _selectedIndex != index,
                  icon: _icons[index],
                  label: _labels[index],
                  onTap: () => setState(() => _selectedIndex = index),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _BottomItemBar extends StatelessWidget {
  final bool showIcon;
  final Widget icon;
  final String label;
  final VoidCallback onTap;
  const _BottomItemBar({
    required this.showIcon,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);

    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          showIcon ? icon : SvgPicture.asset(Assets.icons.point),
          if (!showIcon) ...[
            const SizedBox(width: 7),
            Text(
              label,
              style: appTheme.textTheme.h2.copyWith(color: appTheme.colorsScheme.white),
            ),
          ],
        ],
      ),
    );
  }
}
