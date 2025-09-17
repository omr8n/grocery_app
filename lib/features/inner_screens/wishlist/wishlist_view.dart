import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:grocery_app/core/cubits/products_cubit/products_cubit.dart';
import 'package:grocery_app/core/cubits/wishlist_cubit/wishlist_cubit.dart';
import 'package:grocery_app/core/widgets/empty_screen.dart';
import 'package:grocery_app/features/inner_screens/wishlist/wishlist_widget.dart';

class WishlistView extends StatelessWidget {
  static const routeName = 'WishlistScreen';
  const WishlistView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishlistCubit, WishlistState>(
      builder: (context, state) {
        final items = (state is WishlistUpdated) ? state.wishlistItems : [];

        if (items.isEmpty) {
          return const Scaffold(
            body: EmptyScreen(
              title: 'Your Wishlist Is Empty',
              subtitle: 'Explore more and shortlist some items',
              imagePath: 'assets/images/wishlist.png',
              buttonText: 'Add a wish',
            ),
          );
        }

        return Scaffold(
          appBar: AppBar(
            title: Text("Wishlist (${items.length})"),
            actions: [
              IconButton(
                onPressed: () => context.read<WishlistCubit>().clearWishlist(),
                icon: const Icon(
                  Icons.delete_forever_rounded,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          body: MasonryGridView.count(
            crossAxisCount: 2,
            itemCount: items.length,
            itemBuilder: (context, index) {
              final productId = items[index].productId;
              final productEntity = context.read<ProductsCubit>().findByProdId(
                productId,
              );

              if (productEntity == null) {
                return const SizedBox.shrink();
              }

              return WishlistItem(productEntity: productEntity);
            },
          ),
        );
      },
    );
  }
}
