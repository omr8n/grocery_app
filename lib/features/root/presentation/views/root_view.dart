import 'package:flutter/material.dart';

import '../../../cart/presentation/view/cart_view.dart';
import '../../../categories/presentation/views/categories_view.dart';
import '../../../home/presentation/views/home_view.dart';
import '../../../user/presentation/views/user_view.dart';
import 'widgets/custom_bottom_navigation_bar.dart';

class RootView extends StatefulWidget {
  static const routeName = '/';
  const RootView({super.key});

  @override
  State<RootView> createState() => _RootViewState();
}

class _RootViewState extends State<RootView> {
  late PageController controller;
  int currentView = 0;
  bool isLoadingProds = true;

  List<Map<String, dynamic>> screens = [
    // const HomeView(),
    // CategoriesView(),
    // const CartView(),
    // const UserView()
    {'page': const HomeView(), 'title': 'Home View'},
    {'page': CategoriesView(), 'title': 'Categories View'},
    {'page': const CartView(), 'title': 'Cart View'},
    {'page': const UserView(), 'title': 'user View'},
  ];
  final List<Map<String, dynamic>> pages = [
    {'page': const HomeView(), 'title': 'Home View'},
    {'page': CategoriesView(), 'title': 'Categories View'},
    {'page': const CartView(), 'title': 'Cart View'},
    {'page': const UserView(), 'title': 'user View'},
  ];
  void _selectedView(int index) {
    setState(() {
      currentView = index;
    });
  }

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: currentView.round());
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentView]["page"],

      // bottomNavigationBar: CustomBottomNavigationBar(
      //   selectedIndex: currentView,
      //   onDestinationSelected: (index) {
      //     setState(() {
      //       currentView = index.round();
      //     });
      //     // controller.animateToPage(currentView,
      //     //     duration: const Duration(milliseconds: 500),
      //     //     curve: Curves.easeInOut);
      //     controller.jumpToPage(currentView);
      //   },
      // ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: currentView,
        onDestinationSelected: (index) {
          setState(() {
            currentView = index.round();
          });
          // controller.animateToPage(currentView,
          //     duration: const Duration(milliseconds: 500),
          //     curve: Curves.easeInOut);
          //  controller.jumpToPage(currentView);
        },
      ),
    );
  }
}
