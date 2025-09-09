// // import 'package:flutter/material.dart';
// // import 'package:flutter_iconly/flutter_iconly.dart';

// // class CustomBottomNavigationBar extends StatelessWidget {
// //   const CustomBottomNavigationBar({
// //     super.key,
// //     required this.onDestinationSelected,
// //     this.selectedIndex = 0,
// //   });
// //   final int selectedIndex;
// //   final void Function(int index)? onDestinationSelected;
// //   @override
// //   Widget build(BuildContext context) {
// //     return BottomNavigationBar(
// //       backgroundColor: Theme.of(context).scaffoldBackgroundColor,
// //       type: BottomNavigationBarType.fixed,
// //       showSelectedLabels: false,
// //       showUnselectedLabels: false,
// //       currentIndex: selectedIndex,
// //       // unselectedItemColor: _isDark ? Colors.white10 : Colors.black12,
// //       // selectedItemColor: _isDark ? Colors.lightBlue.shade200 : Colors.black87,
// //       onTap: onDestinationSelected,
// //       items: <BottomNavigationBarItem>[
// //         BottomNavigationBarItem(
// //           icon: Icon(selectedIndex == 0 ? IconlyBold.home : IconlyLight.home),
// //           label: "Home",
// //         ),
// //         BottomNavigationBarItem(
// //           icon: Icon(
// //             selectedIndex == 1 ? IconlyBold.category : IconlyLight.category,
// //           ),
// //           label: "Categories",
// //         ),
// //         BottomNavigationBarItem(
// //           // icon: Badge(
// //           //   toAnimate: true,
// //           //   shape: BadgeShape.circle,
// //           //   badgeColor: Colors.blue,
// //           //   borderRadius: BorderRadius.circular(8),
// //           //   position: BadgePosition.topEnd(top: -7, end: -7),
// //           //   badgeContent: FittedBox(
// //           //       child: CustomText(
// //           //           text: "effw",

// //           //           fontSize: 15, isTitle: true,)),
// //           //   child:
// //           //       Icon(selectedIndex == 2 ? IconlyBold.buy : IconlyLight.buy),
// //           // ),
// //           label: "Cart",
// //           icon: Icon(selectedIndex == 2 ? IconlyBold.buy : IconlyLight.buy),
// //           // label: "Cart",
// //         ),
// //         BottomNavigationBarItem(
// //           icon: Icon(selectedIndex == 3 ? IconlyBold.user2 : IconlyLight.user2),
// //           label: "User",
// //         ),
// //       ],
// //     );

// //     //  final cartProvider = Provider.of<CartProvider>(context);
// //     // return NavigationBar(
// //     //   selectedIndex: selectedIndex,
// //     //   //selectedIndex: currentView,
// //     //   backgroundColor: Theme.of(context).scaffoldBackgroundColor,
// // //     //   elevation: 2,
// // //     //   height: kBottomNavigationBarHeight,
// // //     //   onDestinationSelected: onDestinationSelected,
// // //     //   // onDestinationSelected: (index) {
// // //     //   //   setState(() {
// // //     //   //    currentView = index;
// // //     //   //   });
// // //     //   //    controller.jumpToPage(currentView);
// // //     //   // },
// // //     //   destinations: [
// // //     //     const NavigationDestination(
// // //     //       selectedIcon: Icon(IconlyBold.home),
// // //     //       icon: Icon(IconlyLight.home),
// // //     //       label: "Home",
// // //     //     ),
// // //     //     const NavigationDestination(
// // //     //       selectedIcon: Icon(IconlyBold.search),
// // //     //       icon: Icon(IconlyLight.search),
// // //     //       label: "Search",
// // //     //     ),
// // //     //     NavigationDestination(
// // //     //       selectedIcon: const Icon(IconlyBold.bag2),
// // //     //       icon: Icon(IconlyLight.search),
// // //     //       // icon: Consumer<CartProvider>(
// // //     //       //   builder: (context, cartProvider, child) {
// // //     //       //     return Badge(
// // //     //       //       backgroundColor: Colors.blue,
// // //     //       //       label: Text(cartProvider.getCartItems.length.toString()),
// // //     //       //       child: const Icon(IconlyLight.bag2),
// // //     //       //     );
// // //     //       //   },
// // //     //       // ),
// // //     //       label: "Cart",
// // //     //     ),
// // //     //     const NavigationDestination(
// // //     //       selectedIcon: Icon(IconlyBold.profile),
// // //     //       icon: Icon(IconlyLight.profile),
// // //     //       label: "Profile",
// // //     //     ),
// // //     //   ],
// // //     // );
// // //   }
// // // }

// import 'package:flutter/material.dart';
// import 'package:flutter_iconly/flutter_iconly.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:badges/badges.dart' as badges;

// // import '../../../../cart/presentation/manger/cubits/cart_cubit/cart_cubit.dart';

// class CustomBottomNavigationBar extends StatelessWidget {
//   const CustomBottomNavigationBar({
//     super.key,
//     required this.onDestinationSelected,
//     this.selectedIndex = 0,
//   });

//   final int selectedIndex;
//   final void Function(int index)? onDestinationSelected;

//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//       type: BottomNavigationBarType.fixed,
//       showSelectedLabels: false,
//       showUnselectedLabels: false,
//       currentIndex: selectedIndex,
//       onTap: onDestinationSelected,
//       items: <BottomNavigationBarItem>[
//         BottomNavigationBarItem(
//           icon: Icon(selectedIndex == 0 ? IconlyBold.home : IconlyLight.home),
//           label: "Home",
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(
//             selectedIndex == 1 ? IconlyBold.category : IconlyLight.category,
//           ),
//           label: "Categories",
//         ),
//         // BottomNavigationBarItem(

//         // BlocBuilder<CartCubit, CartState>(
//         //   builder: (context, state) {
//         //     final cartCount = context.watch<CartCubit>().cartItems.length;

//         //     return badges.Badge(
//         //       showBadge: cartCount > 0,
//         //       badgeContent: Text(
//         //         cartCount.toString(),
//         //         style: const TextStyle(
//         //           color: Colors.white,
//         //           fontSize: 10,
//         //           fontWeight: FontWeight.bold,
//         //         ),
//         //       ),
//         //       position: badges.BadgePosition.topEnd(top: -8, end: -8),
//         //       child: Icon(
//         //         selectedIndex == 2 ? IconlyBold.buy : IconlyLight.buy,
//         //       ),
//         //     );
//         //   },
//         // ),
//         //   label: "Cart",
//         // ),

//         // BottomNavigationBarItem(
//         //   icon: BlocBuilder<CartCubit, CartState>(
//         //     builder: (context, state) {
//         //       final cartCount = context.watch<CartCubit>().cartItems.length;

//         //       return badges.Badge(
//         //         showBadge: cartCount > 0,
//         //         badgeContent: Text(
//         //           cartCount.toString(),
//         //           style: const TextStyle(
//         //             color: Colors.white,
//         //             fontSize: 10,
//         //             fontWeight: FontWeight.bold,
//         //           ),
//         //         ),
//         //         position: badges.BadgePosition.topEnd(top: -8, end: -8),
//         //         child: Icon(
//         //           selectedIndex == 2 ? IconlyBold.buy : IconlyLight.buy,
//         //         ),
//         //       );
//         //     },
//         //   ),
//         //   label: "Cart",
//         // ),
//         BottomNavigationBarItem(
//           icon: Icon(selectedIndex == 3 ? IconlyBold.user2 : IconlyLight.user2),
//           label: "User",
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:badges/badges.dart' as badges;

import '../../../../cart/presentation/manger/cubits/cart_cubit/cart_cubit.dart';

// class CustomBottomNavigationBar extends StatelessWidget {
//   const CustomBottomNavigationBar({
//     super.key,
//     required this.onDestinationSelected,
//     this.selectedIndex = 0,
//   });

//   final int selectedIndex;
//   final void Function(int index)? onDestinationSelected;

//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//       type: BottomNavigationBarType.fixed,
//       showSelectedLabels: false,
//       showUnselectedLabels: false,
//       currentIndex: selectedIndex,
//       onTap: onDestinationSelected,
//       items: <BottomNavigationBarItem>[
//         BottomNavigationBarItem(
//           icon: Icon(selectedIndex == 0 ? IconlyBold.home : IconlyLight.home),
//           label: "Home",
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(
//             selectedIndex == 1 ? IconlyBold.category : IconlyLight.category,
//           ),
//           label: "Categories",
//         ),
//         BottomNavigationBarItem(
//           // icon: badges.Badge(
//           //   showBadge: cartItemCount > 0,
//           //   badgeContent: Text(
//           //     cartItemCount.toString(),
//           //     style: const TextStyle(
//           //       color: Colors.white,
//           //       fontSize: 10,
//           //       fontWeight: FontWeight.bold,
//           //     ),
//           //   ),
//           //   position: badges.BadgePosition.topEnd(top: -8, end: -8),
//           //   child: Icon(selectedIndex == 2 ? IconlyBold.buy : IconlyLight.buy),
//           // ),
//           // label: "Cart",
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(selectedIndex == 3 ? IconlyBold.user2 : IconlyLight.user2),
//           label: "User",
//         ),
//       ],
//     );
//   }
// }
class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
    required this.onDestinationSelected,
    this.selectedIndex = 0,
    this.cartItemCount = 0, // عدد عناصر السلة
  });

  final int selectedIndex;
  final int cartItemCount;
  final void Function(int index)? onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      currentIndex: selectedIndex,
      onTap: onDestinationSelected,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(selectedIndex == 0 ? IconlyBold.home : IconlyLight.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            selectedIndex == 1 ? IconlyBold.category : IconlyLight.category,
          ),
          label: "Categories",
        ),
        BottomNavigationBarItem(
          icon: badges.Badge(
            showBadge: cartItemCount > 0,
            badgeContent: Text(
              cartItemCount.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
            position: badges.BadgePosition.topEnd(top: -8, end: -8),
            child: Icon(selectedIndex == 2 ? IconlyBold.buy : IconlyLight.buy),
          ),
          label: "Cart",
        ),
        BottomNavigationBarItem(
          icon: Icon(selectedIndex == 3 ? IconlyBold.user2 : IconlyLight.user2),
          label: "User",
        ),
      ],
    );
  }
}
