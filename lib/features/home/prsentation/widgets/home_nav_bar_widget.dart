import 'package:dalel/core/utils/app_assets.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/features/cart/presentation/views/cart_view.dart';
import 'package:dalel/features/home/prsentation/cubit/home_cubit.dart';
import 'package:dalel/features/home/prsentation/view/home_view.dart';
import 'package:dalel/features/profile/presentation/views/profile_view.dart';
import 'package:dalel/features/search/presentation/views/search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

PersistentTabController _controller = PersistentTabController();

class HomeNavBarWidget extends StatelessWidget {
  const HomeNavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: _buildScreens(),
      controller: _controller,
      items: _navBarsItems(),
      navBarStyle: NavBarStyle.style12,
      backgroundColor: AppColors.primaryColor,
      decoration: const NavBarDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
    );
  }
}

List<Widget> _buildScreens() {
  return [
    BlocProvider(
      create: (context) => HomeCubit()..getHistoricalPeriods(),
      child: const HomeView(),
    ),
    const CartView(),
    const SearchView(),
    const ProfileView()
  ];
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    PersistentBottomNavBarItem(
        inactiveIcon: SvgPicture.asset(AppAssets.imagesHomeIcon),
        icon: SvgPicture.asset(AppAssets.imagesHomeIconActive)),
    PersistentBottomNavBarItem(
      inactiveIcon: SvgPicture.asset(AppAssets.imagesShoppingCart),
      icon: SvgPicture.asset(AppAssets.imagesShoppingCartActive),
    ),
    PersistentBottomNavBarItem(
      inactiveIcon: SvgPicture.asset(AppAssets.imagesSearch),
      icon: SvgPicture.asset(AppAssets.imagesSearchActive),
    ),
    PersistentBottomNavBarItem(
      inactiveIcon: SvgPicture.asset(AppAssets.imagesPerson),
      icon: SvgPicture.asset(AppAssets.imagesPersonActive),
    ),
  ];
}
