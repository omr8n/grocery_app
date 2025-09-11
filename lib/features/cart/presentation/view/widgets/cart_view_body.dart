import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/features/cart/domain/entites/cart_item_entity.dart';
import 'package:grocery_app/features/cart/presentation/manger/cubits/cart_cubit/cart_cubit.dart';
import 'package:grocery_app/features/cart/presentation/view/widgets/cart_list_view.dart';
import 'package:grocery_app/features/cart/presentation/view/widgets/custom_chekout.dart';
import 'package:grocery_app/features/inner_screens/auth/domain/entites/user_entity.dart';

import '../../../../../core/cubits/orders_cubit/orders_cubit.dart';
import '../../../../../core/cubits/orders_cubit/orders_state.dart';

import '../../../../../core/entites/order_product_entity.dart';
import '../../../../../core/helper/get_user.dart';
import '../../../../../core/models/cart_item_model.dart';

import '../../../../../core/models/cart_model.dart';
// import '../../../../../core/services/firebase_auth_service.dart';

import '../../../../../core/widgets/empty_screen.dart';

// import '../../../../inner_screens/auth/domain/entites/user_entity.dart';
// import '../../../domain/entites/cart_item_entity.dart';

// import '../../manger/cubits/cart_cubit/cart_cubit.dart';
// import 'cart_list_view.dart';

class CartViewBody extends StatefulWidget {
  const CartViewBody({super.key});

  @override
  State<CartViewBody> createState() => _CartViewBodyState();
}

class _CartViewBodyState extends State<CartViewBody> {
  // bool _isPlacingOrder = false;
  @override
  Widget build(BuildContext context) {
    return BlocListener<OrdersCubit, OrdersState>(
      listener: (context, state) {
        if (state is OrderAddedSuccess) {
          context.read<CartCubit>().clearCart();
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text("تم إتمام الطلب بنجاح")));
        } else if (state is OrderAddingError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      child: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          final cartCubit = context.read<CartCubit>();
          final cartItems = cartCubit.items;

          if (cartItems.isEmpty) {
            return const Center(
              child: EmptyScreen(
                title: 'Your cart is empty',
                subtitle: 'Add something and make me happy :)',
                buttonText: 'Shop now',
                imagePath: 'assets/images/cart.png',
              ),
            );
          }

          final total = cartCubit.totalPrice;
          final isPlacingOrder =
              context.watch<OrdersCubit>().state is OrderAdding;

          return Column(
            children: [
              CustomChekout(
                totalPrice: total,
                isLoading: isPlacingOrder,
                function: isPlacingOrder
                    ? null
                    : () => _placeOrder(context, cartItems, total),
              ),
              Flexible(child: CartListView(cartItems: cartItems)),
              // CartBottomCheckout(
              //   totalPrice: total,
              //   isLoading: isPlacingOrder,
              //   function: isPlacingOrder
              //       ? null
              //       : () => _placeOrder(context, cartItems, total),
              // ),
            ],
          );
        },
      ),
    );
  }

  Future<void> _placeOrder(
    BuildContext context,
    List<CartItemEntity> cartItems,
    double totalPrice,
  ) async {
    final firebaseUser = FirebaseAuth.instance.currentUser;

    if (firebaseUser == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("يجب تسجيل الدخول لإتمام الطلب")),
      );
      return;
    }

    final cartModel = CartModel(
      cartItems: cartItems.map(CartItemModel.fromEntity).toList(),
    );

    final orderProducts = cartItems
        .map(
          (item) => OrderProductEntity(
            name: item.productEntity.name,
            imageUrl: item.productEntity.imageUrl ?? '',
            price: item.productEntity.price,
            quantity: item.quantity,
          ),
        )
        .toList();

    final userEntity = UserEntity(
      name: getUser().name,
      email: getUser().email,
      uId: getUser().uId,
      // userImage: user.photoURL,
      // image: null,
      // createdAt: null,
      // userCart: null,
      // userWish: null,
    );

    context.read<OrdersCubit>().addOrder(
      cartEntity: cartModel.toEntity(),
      orderProducts: orderProducts,
      totalPrice: totalPrice,
      userEntity: userEntity,
    );
  }
}
