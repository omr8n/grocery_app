import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:grocery_app/core/widgets/custom_text.dart';

import '../../../core/helper/functions/global_methods.dart';
import '../../../core/utils/utils.dart';
import '../../../core/widgets/back_widget.dart';
import '../../../core/widgets/empty_screen.dart';
import 'wishlist_widget.dart';

class WishlistView extends StatelessWidget {
  static const routeName = "/WishlistScreen";
  const WishlistView({super.key});

  @override
  Widget build(BuildContext context) {
    //  final Color color = Utils(context).color;
    Size size = Utils(context).getScreenSize;
    bool isEmbty = false;
    // final wishlistProvider = Provider.of<WishlistProvider>(context);
    // final wishlistItemsList =
    //     wishlistProvider.getWishlistItems.values.toList().reversed.toList();
    return isEmbty
        ? const EmptyScreen(
            title: 'Your Wishlist Is Empty',
            subtitle: 'Explore more and shortlist some items',
            imagePath: 'assets/images/wishlist.png',
            buttonText: 'Add a wish',
          )
        : Scaffold(
            appBar: AppBar(
              centerTitle: true,
              leading: const BackWidget(),
              automaticallyImplyLeading: false,
              elevation: 0,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              title: CustomText(
                // text: 'Wishlist (${wishlistItemsList.length})',
                text: "Wishlist 23",
                // color: color,
                isTitle: true,
                fontSize: 22,
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    GlobalMethods.warningDialog(
                      title: 'Empty your wishlist?',
                      subtitle: 'Are you sure?',
                      fct: () async {
                        // await wishlistProvider.clearOnlineWishlist();
                        // wishlistProvider.clearLocalWishlist();
                      },
                      context: context,
                    );
                  },
                  icon: Icon(IconlyBroken.delete),
                ),
              ],
            ),
            body: MasonryGridView.count(
              // itemCount: wishlistItemsList.length,
              itemCount: 10,
              crossAxisCount: 2,
              // mainAxisSpacing: 16,
              // crossAxisSpacing: 20,
              itemBuilder: (context, index) {
                return WishlistItem();
                // return ChangeNotifierProvider.value(
                //     value: wishlistItemsList[index],
                //     child: const WishlistWidget());
              },
            ),
          );
  }
}
