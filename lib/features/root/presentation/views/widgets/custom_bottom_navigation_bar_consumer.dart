// // // // // // import 'package:e_commerce_shop_smart/core/helper/my_app_method.dart';
// // // // // // import 'package:flutter/material.dart';
// // // // // // import 'package:flutter_bloc/flutter_bloc.dart';

// // // // // // import '../../../../cart/presentation/cubits/cart_cubit/cart_cubit.dart';

// // // // // // class CustomBottomNavigationBarConsumer extends StatelessWidget {
// // // // // //   const CustomBottomNavigationBarConsumer({super.key, required this.child});

// // // // // //   final Widget child;

// // // // // //   @override
// // // // // //   Widget build(BuildContext context) {
// // // // // //     return BlocListener<CartCubit, CartState>(
// // // // // //       listener: (context, state) {
// // // // // //         if (state is CartItemAdded) {
// // // // // //           MyAppMethods.showErrorORWarningDialog(
// // // // // //             context: context,
// // // // // //             subtitle: "Product added to cart",
// // // // // //             fct: () {},
// // // // // //           );
// // // // // //         }
// // // // // //         if (state is CartItemRemoved) {
// // // // // //           MyAppMethods.showErrorORWarningDialog(
// // // // // //             context: context,
// // // // // //             subtitle: "Product removed from cart",
// // // // // //             fct: () {},
// // // // // //           );
// // // // // //         }
// // // // // //       },
// // // // // //       child: child,
// // // // // //     );
// // // // // //   }
// // // // // // }
// // // // // import 'package:e_commerce_shop_smart/core/helper/my_app_method.dart';
// // // // // import 'package:flutter/material.dart';
// // // // // import 'package:flutter_bloc/flutter_bloc.dart';

// // // // // import '../../../../cart/presentation/cubits/cart_cubit/cart_cubit.dart';

// // // // // class CustomBottomNavigationBarConsumer extends StatelessWidget {
// // // // //   const CustomBottomNavigationBarConsumer({super.key, required this.child});

// // // // //   final Widget child;

// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     return BlocListener<CartCubit, CartState>(
// // // // //       listener: (context, state) {
// // // // //         if (state is CartAuthRequired) {
// // // // //           showDialog(
// // // // //             context: context,
// // // // //             builder:
// // // // //                 (_) => AlertDialog(
// // // // //                   title: const Text("تنبيه"),
// // // // //                   content: const Text(
// // // // //                     "يجب عليك تسجيل الدخول لإضافة المنتجات إلى السلة.",
// // // // //                   ),
// // // // //                   actions: [
// // // // //                     TextButton(
// // // // //                       onPressed: () => Navigator.pop(context),
// // // // //                       child: const Text("إلغاء"),
// // // // //                     ),
// // // // //                     TextButton(
// // // // //                       onPressed: () {
// // // // //                         Navigator.pop(context);
// // // // //                         Navigator.pushNamed(context, '/LoginView');
// // // // //                       },
// // // // //                       child: const Text("تسجيل الدخول"),
// // // // //                     ),
// // // // //                   ],
// // // // //                 ),
// // // // //           );
// // // // //         } else if (state is CartItemAdded) {
// // // // //           MyAppMethods.showErrorORWarningDialog(
// // // // //             context: context,
// // // // //             subtitle: state.message,
// // // // //             fct: () {},
// // // // //           );
// // // // //         } else if (state is CartItemRemoved) {
// // // // //           MyAppMethods.showErrorORWarningDialog(
// // // // //             context: context,
// // // // //             subtitle: state.message,
// // // // //             fct: () {},
// // // // //           );
// // // // //         } else if (state is CartCleared) {
// // // // //           MyAppMethods.showErrorORWarningDialog(
// // // // //             context: context,
// // // // //             subtitle: "Cart cleared",
// // // // //             fct: () {},
// // // // //           );
// // // // //         }
// // // // //       },
// // // // //       child: child,
// // // // //     );
// // // // //   }
// // // // // }

// // // // import 'package:e_commerce_shop_smart/core/helper/my_app_method.dart';
// // // // import 'package:flutter/material.dart';
// // // // import 'package:flutter_bloc/flutter_bloc.dart';

// // // // import '../../../../cart/presentation/cubits/cart_cubit/cart_cubit.dart';

// // // // class CustomBottomNavigationBarConsumer extends StatelessWidget {
// // // //   const CustomBottomNavigationBarConsumer({super.key, required this.child});

// // // //   final Widget child;

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return BlocListener<CartCubit, CartState>(
// // // //       listener: (context, state) {
// // // //         switch (state.runtimeType) {
// // // //           case const (CartAuthRequired):
// // // //             _showAuthDialog(context);
// // // //             break;

// // // //           case const (CartItemAdded):
// // // //             final addedState = state as CartItemAdded;
// // // //             ScaffoldMessenger.of(context).showSnackBar(
// // // //               SnackBar(
// // // //                 content: Text(addedState.toString()),
// // // //                 duration: Duration(seconds: 2),
// // // //                 behavior:
// // // //                     SnackBarBehavior
// // // //                         .floating, // اختياري، يجعل الـ SnackBar عائم
// // // //                 backgroundColor: Colors.green, // اللون حسب الحاجة
// // // //               ),
// // // //             );

// // // //             // MyAppMethods.showErrorORWarningDialog(
// // // //             //   context: context,
// // // //             //   subtitle: addedState.message,
// // // //             //   fct: () {},
// // // //             // );
// // // //             break;

// // // //           case const (CartItemRemoved):
// // // //             final removedState = state as CartItemRemoved;
// // // //             MyAppMethods.showErrorORWarningDialog(
// // // //               context: context,
// // // //               subtitle: removedState.message,
// // // //               fct: () {},
// // // //             );
// // // //             break;

// // // //           case const (CartCleared):
// // // //             MyAppMethods.showErrorORWarningDialog(
// // // //               context: context,
// // // //               subtitle: "Cart cleared",
// // // //               fct: () {},
// // // //             );
// // // //             break;

// // // //           default:
// // // //             break;
// // // //         }
// // // //       },
// // // //       child: child,
// // // //     );
// // // //   }

// // // //   void _showAuthDialog(BuildContext context) {
// // // //     showDialog(
// // // //       context: context,
// // // //       builder:
// // // //           (_) => AlertDialog(
// // // //             title: const Text("تنبيه"),
// // // //             content: const Text(
// // // //               "يجب عليك تسجيل الدخول لإضافة المنتجات إلى السلة.",
// // // //             ),
// // // //             actions: [
// // // //               TextButton(
// // // //                 onPressed: () => Navigator.pop(context),
// // // //                 child: const Text("إلغاء"),
// // // //               ),
// // // //               TextButton(
// // // //                 onPressed: () {
// // // //                   Navigator.pop(context);
// // // //                   Navigator.pushNamed(context, '/LoginView');
// // // //                 },
// // // //                 child: const Text("تسجيل الدخول"),
// // // //               ),
// // // //             ],
// // // //           ),
// // // //     );
// // // //   }
// // // // }

// // // // import 'package:e_commerce_shop_smart/core/helper/my_app_method.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:grocery_app/core/helper/functions/build_error_bar.dart';

// // import '../../../../cart/presentation/manger/cubits/cart_cubit/cart_cubit.dart';
// // import '../../../../inner_screens/auth/signin_view.dart';

// // class CustomBottomNavigationBarConsumer extends StatelessWidget {
// //   const CustomBottomNavigationBarConsumer({super.key, required this.child});

// //   final Widget child;

// //   @override
// //   Widget build(BuildContext context) {
// //     return BlocListener<CartCubit, CartState>(
// //       listener: (context, state) {
// //         if (state is CartAuthRequired) {
// //           _showAuthDialog(context);
// //         } else if (state is CartItemAdded) {
// //           ScaffoldMessenger.of(context).showSnackBar(
// //             SnackBar(
// //               content: Text(state.message),
// //               duration: const Duration(seconds: 2),
// //               behavior: SnackBarBehavior.floating,
// //               backgroundColor: Colors.green,
// //             ),
// //           );
// //         } else if (state is CartItemRemoved) {
// //           showBar(context, state.message);
// //         }
// //         // else if (state is CartCleared) {
// //         //   MyAppMethods.showErrorORWarningDialog(
// //         //     context: context,
// //         //     subtitle: "Cart cleared",
// //         //     fct: () {},
// //         //   );
// //         // }
// //       },
// //       child: child,
// //     );
// //   }

// //   void _showAuthDialog(BuildContext context) {
// //     showDialog(
// //       context: context,
// //       builder: (_) => AlertDialog(
// //         title: const Text("تنبيه"),
// //         content: const Text("يجب عليك تسجيل الدخول لإضافة المنتجات إلى السلة."),
// //         actions: [
// //           TextButton(
// //             onPressed: () => Navigator.pop(context),
// //             child: const Text("إلغاء"),
// //           ),
// //           TextButton(
// //             onPressed: () {
// //               Navigator.pop(context);

// //               Navigator.pushNamed(context, SigninView.routeName);
// //             },
// //             child: const Text("تسجيل الدخول"),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:grocery_app/Features/cart/presentation/manger/cubits/cart_cubit/cart_cubit.dart';
// import 'package:grocery_app/features/cart/presentation/manger/cubits/cart_cubit/cart_state.dart'
//     hide CartState, CartAuthRequired;
// import '../../../../cart/presentation/manger/cubits/cart_cubit/cart_cubit.dart'
//     hide CartCubit;

// class CustomBottomNavigationBarConsumer extends StatelessWidget {
//   const CustomBottomNavigationBarConsumer({super.key, required this.child});
//   final Widget child;

//   @override
//   Widget build(BuildContext context) {
//     final cartCubit = context.read<CartCubit>();
//     if (cartCubit == null) return child;

//     return BlocListener<CartCubit, CartState>(
//       listener: (context, state) {
//         if (state is CartAuthRequired) {
//           _showAuthDialog(context);
//         } else if (state is CartItemAdded) {
//           _showSnackBar(context, state.message, Colors.green);
//         } else if (state is CartItemRemoved) {
//           _showSnackBar(context, state.message, Colors.red);
//         }
//       },
//       child: child,
//     );
//   }

//   void _showSnackBar(BuildContext context, String message, Color color) {
//     ScaffoldMessenger.of(context)
//       ..hideCurrentSnackBar()
//       ..showSnackBar(
//         SnackBar(
//           content: Text(message),
//           duration: const Duration(seconds: 2),
//           behavior: SnackBarBehavior.floating,
//           backgroundColor: color,
//         ),
//       );
//   }

//   void _showAuthDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (_) => AlertDialog(
//         title: const Text("تنبيه"),
//         content: const Text("يجب عليك تسجيل الدخول لإضافة المنتجات إلى السلة."),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text("إلغاء"),
//           ),
//           TextButton(
//             onPressed: () {
//               Navigator.pop(context);
//               Navigator.pushNamed(context, '/signin');
//             },
//             child: const Text("تسجيل الدخول"),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/features/cart/presentation/manger/cubits/cart_cubit/cart_cubit.dart';
// import 'package:grocery_app/features/cart/presentation/manger/cubits/cart_cubit/cart_state.dart';

class CustomBottomNavigationBarConsumer extends StatelessWidget {
  const CustomBottomNavigationBarConsumer({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CartAuthRequired) {
          _showAuthDialog(context);
        } else if (state is CartItemAdded) {
          _showSnackBar(context, state.message, Colors.green);
        } else if (state is CartItemRemoved) {
          _showSnackBar(context, state.message, Colors.red);
        }
      },
      builder: (context, state) {
        return child;
      },
    );
  }

  void _showSnackBar(BuildContext context, String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _showAuthDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("تنبيه"),
        content: const Text("يجب عليك تسجيل الدخول لإضافة المنتجات إلى السلة."),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("إلغاء"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/signin');
            },
            child: const Text("تسجيل الدخول"),
          ),
        ],
      ),
    );
  }
}
