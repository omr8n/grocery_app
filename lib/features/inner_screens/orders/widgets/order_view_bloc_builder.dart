// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:grocery_app/core/cubits/orders_cubit/orders_cubit.dart';
// // import 'package:grocery_app/core/cubits/orders_cubit/orders_state.dart';
// // import 'package:grocery_app/features/inner_screens/orders/widgets/order_view_body.dart';

// // import '../../../../core/widgets/empty_screen.dart';

// // // class OrderViewBlocBuilder extends StatelessWidget {
// // //   const OrderViewBlocBuilder({super.key});

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return BlocBuilder<OrdersCubit, OrdersState>(
// // //       builder: (context, state) {
// // //         if (state is OrdersLoading) {
// // //           return const EmptyScreen(
// // //             title: 'Loading your orders...',
// // //             subtitle: 'Please wait a moment',
// // //             buttonText: '',
// // //             imagePath: 'assets/images/cart.png',
// // //           );
// // //         } else if (state is AllOrderSuccess) {
// // //           return OrderViewBody(ordersList: state.orders); // ← هنا نمرر البيانات
// // //         } else if (state is OrdersError) {
// // //           return EmptyScreen(
// // //             title: 'Oops! Something went wrong',
// // //             subtitle: state.message,
// // //             buttonText: 'Try again',
// // //             imagePath: 'assets/images/cart.png',
// // //           );
// // //         }
// // //         return const SizedBox.shrink();
// // //       },
// // //     );
// // //   }
// // // }
// // class OrderViewBlocBuilder extends StatelessWidget {
// //   const OrderViewBlocBuilder({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return BlocBuilder<OrdersCubit, OrdersState>(
// //       builder: (context, state) {
// //         if (state is OrdersLoading) {
// //           return const Center(child: CircularProgressIndicator());
// //         } else if (state is AllOrderSuccess) {
// //           if (state.orders.isEmpty) {
// //             return const EmptyScreen(
// //               title: 'No orders yet',
// //               subtitle: 'Start shopping and place your first order!',
// //               buttonText: 'Shop now',
// //               imagePath: 'assets/images/cart.png',
// //             );
// //           }
// //           return OrderViewBody(ordersList: state.orders);
// //         } else if (state is OrdersError) {
// //           return EmptyScreen(
// //             title: 'Oops! Something went wrong',
// //             subtitle: state.message,
// //             buttonText: 'Try again',
// //             imagePath: 'assets/images/cart.png',
// //           );
// //         }
// //         return const SizedBox.shrink();
// //       },
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:grocery_app/core/cubits/orders_cubit/orders_cubit.dart';
// import 'package:grocery_app/core/cubits/orders_cubit/orders_state.dart';
// import 'package:grocery_app/features/inner_screens/orders/widgets/order_view_body.dart';
// import '../../../../core/widgets/empty_screen.dart';

// class OrderViewBlocBuilder extends StatelessWidget {
//   const OrderViewBlocBuilder({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<OrdersCubit, OrdersState>(
//       builder: (context, state) {
//         // 👈 أول ما يفتح، حالة Initial
//         if (state is OrdersInitial) {
//           return const EmptyScreen(
//             title: 'No orders yet',
//             subtitle: 'Start shopping and place your first order!',
//             buttonText: 'Shop now',
//             imagePath: 'assets/images/cart.png',
//           );
//         }
//         // 👈 أثناء التحميل
//         else if (state is OrdersLoading) {
//           return const Center(child: CircularProgressIndicator());
//         }
//         // 👈 إذا جابت الداتا بنجاح
//         else if (state is AllOrderSuccess) {
//           if (state.orders.isEmpty) {
//             return const EmptyScreen(
//               title: 'No orders yet',
//               subtitle: 'Start shopping and place your first order!',
//               buttonText: 'Shop now',
//               imagePath: 'assets/images/cart.png',
//             );
//           }
//           return OrderViewBody(ordersList: state.orders);
//         }
//         // 👈 في حال الخطأ
//         else if (state is OrdersError) {
//           return EmptyScreen(
//             title: 'Oops! Something went wrong',
//             subtitle: state.message,
//             buttonText: 'Try again',
//             imagePath: 'assets/images/cart.png',
//           );
//         }

//         // 👈 fallback (ما لازم يوصل هون عادةً)
//         return const SizedBox.shrink();
//       },
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/core/cubits/orders_cubit/orders_cubit.dart';
import 'package:grocery_app/core/cubits/orders_cubit/orders_state.dart';
import 'package:grocery_app/core/widgets/empty_screen.dart';
import 'package:grocery_app/features/inner_screens/orders/widgets/order_view_body.dart';

class OrderViewBlocBuilder extends StatelessWidget {
  const OrderViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersCubit, OrdersState>(
      builder: (context, state) {
        if (state is OrdersInitial) {
          return const EmptyScreen(
            title: 'No orders yet',
            subtitle: 'Start shopping and place your first order!',
            buttonText: 'Shop now',
            imagePath: 'assets/images/cart.png',
          );
        } else if (state is OrdersLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is UserOrdersLoaded) {
          if (state.orders.isEmpty) {
            return const EmptyScreen(
              title: 'No orders yet',
              subtitle: 'Start shopping and place your first order!',
              buttonText: 'Shop now',
              imagePath: 'assets/images/cart.png',
            );
          }
          return OrderViewBody(ordersList: state.orders);
        } else if (state is AllOrderSuccess) {
          if (state.orders.isEmpty) {
            return const EmptyScreen(
              title: 'No orders yet',
              subtitle: 'Start shopping and place your first order!',
              buttonText: 'Shop now',
              imagePath: 'assets/images/cart.png',
            );
          }
          return OrderViewBody(ordersList: state.orders);
        } else if (state is OrdersError) {
          return EmptyScreen(
            title: 'Oops! Something went wrong',
            subtitle: state.message,
            buttonText: 'Try again',
            imagePath: 'assets/images/cart.png',
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
