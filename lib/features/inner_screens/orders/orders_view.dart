// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:grocery_app/core/cubits/orders_cubit/orders_cubit.dart';
// import 'package:grocery_app/core/cubits/orders_cubit/orders_state.dart';

// import 'package:grocery_app/core/widgets/custom_text.dart';
// import 'package:grocery_app/features/inner_screens/orders/widgets/order_view_bloc_builder.dart';
// import 'package:grocery_app/features/inner_screens/orders/widgets/order_view_body.dart';
// // import 'package:grocery_app/features/cart/presentation/manger/cubits/cart_cubit/cart_cubit.dart';
// // import 'package:grocery_app/features/inner_screens/orders/widgets/order_view_bloc_builder.dart';
// import 'package:grocery_app/features/inner_screens/orders/widgets/order_view_body_list_view.dart';

// import '../../../core/widgets/back_widget.dart';

// // // import 'widgets/order_view_body.dart';

// // class OrdersView extends StatefulWidget {
// //   static const String routeName = '/OrderScreen';

// //   const OrdersView({super.key});

// //   @override
// //   State<OrdersView> createState() => _OrdersViewState();
// // }

// // class _OrdersViewState extends State<OrdersView> {
// //   @override
// //   void initState() {
// //     super.initState();
// //     context.read<OrdersCubit>().fetchUserOrders();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     // final itemCount = context.watch<CartCubit>().cartItems.length;
// //     return Scaffold(
// //       appBar: AppBar(
// //         leading: const BackWidget(),
// //         elevation: 0,
// //         centerTitle: false,
// //         title: CustomText(
// //           text: 'Your orders ()',
// //           fontSize: 24.0,
// //           isTitle: true,
// //         ),
// //         backgroundColor: Theme.of(
// //           context,
// //         ).scaffoldBackgroundColor.withOpacity(0.9),
// //    //   ),
// //       body: OrderViewBlocBuilder(),
// //     );
// //     // return OrderViewBlocBuilder();
// //     // isEmpty
// //     // ? const
// //     // :

// //     // });
// //   }
// // }
// class OrdersView extends StatefulWidget {
//   static const String routeName = '/OrderScreen';

//   const OrdersView({super.key});

//   @override
//   State<OrdersView> createState() => _OrdersViewState();
// }

// class _OrdersViewState extends State<OrdersView> {
//   @override
//   void initState() {
//     super.initState();
//     context.read<OrdersCubit>().fetchUserOrders();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: const BackWidget(),
//         elevation: 0,
//         centerTitle: false,
//         title: BlocBuilder<OrdersCubit, OrdersState>(
//           builder: (context, state) {
//             int count = 0;
//             if (state is AllOrderSuccess) {
//               count = state.orders.length;
//             }
//             return CustomText(
//               text: 'Your orders ($count)',
//               fontSize: 24.0,
//               isTitle: true,
//             );
//           },
//         ),
//         backgroundColor: Theme.of(
//           context,
//         ).scaffoldBackgroundColor.withOpacity(0.9),
//       ),
//       body: const OrderViewBlocBuilder(),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/core/cubits/orders_cubit/orders_cubit.dart';
import 'package:grocery_app/core/cubits/orders_cubit/orders_state.dart';
import 'package:grocery_app/core/widgets/back_widget.dart';
import 'package:grocery_app/core/widgets/custom_text.dart';
import 'package:grocery_app/features/inner_screens/orders/widgets/order_view_bloc_builder.dart';

class OrdersView extends StatefulWidget {
  static const String routeName = '/OrderScreen';

  const OrdersView({super.key});

  @override
  State<OrdersView> createState() => _OrdersViewState();
}

class _OrdersViewState extends State<OrdersView> {
  @override
  void initState() {
    super.initState();
    // 👈 هنا تجيب طلبات المستخدم
    context.read<OrdersCubit>().fetchUserOrders();
    // لو بدك للأدمن استبدلها بـ fetchAllOrders()
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackWidget(),
        elevation: 0,
        centerTitle: false,
        title: BlocBuilder<OrdersCubit, OrdersState>(
          builder: (context, state) {
            int count = 0;
            if (state is UserOrdersLoaded) {
              count = state.orders.length;
            } else if (state is AllOrderSuccess) {
              count = state.orders.length;
            }
            return CustomText(
              text: 'Your orders ($count)',
              fontSize: 24.0,
              isTitle: true,
            );
          },
        ),
        backgroundColor: Theme.of(
          context,
        ).scaffoldBackgroundColor.withOpacity(0.9),
      ),
      body: const OrderViewBlocBuilder(),
    );
  }
}
