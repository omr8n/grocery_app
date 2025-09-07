import 'package:flutter/material.dart';

import 'package:grocery_app/core/widgets/custom_text.dart';

class GlobalMethods {
  static void navigateTo({
    required BuildContext ctx,
    required String routeName,
  }) {
    Navigator.pushNamed(ctx, routeName);
  }

  static Future<void> warningDialog({
    required String title,
    required String subtitle,
    required Function fct,
    required BuildContext context,
  }) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Row(
            children: [
              Image.asset(
                'assets/images/warning-sign.png',
                height: 20,
                width: 20,
                fit: BoxFit.fill,
              ),
              const SizedBox(width: 8),
              Text(title),
            ],
          ),
          content: Text(subtitle),
          actions: [
            TextButton(
              onPressed: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              },
              child: CustomText(
                color: Colors.cyan,
                text: 'Cancel',
                fontSize: 18,
              ),
            ),
            TextButton(
              onPressed: () {
                fct();
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              },
              child: CustomText(color: Colors.red, text: 'OK', fontSize: 18),
            ),
          ],
        );
      },
    );
  }

  static Future<void> errorDialog({
    required String subtitle,
    required BuildContext context,
  }) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Row(
            children: [
              Image.asset(
                'assets/images/warning-sign.png',
                height: 20,
                width: 20,
                fit: BoxFit.fill,
              ),
              const SizedBox(width: 8),
              const Text('An Error occured'),
            ],
          ),
          content: Text(subtitle),
          actions: [
            TextButton(
              onPressed: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              },
              child: CustomText(color: Colors.cyan, text: 'Ok', fontSize: 18),
            ),
          ],
        );
      },
    );
  }

  // static Future<void> addToCart(
  //     {required String productId,
  //     required int quantity,
  //     required BuildContext context}) async {
  //   final User? user = authInstance.currentUser;
  //   final _uid = user!.uid;
  //   final cartId = const Uuid().v4();
  //   try {
  //     FirebaseFirestore.instance.collection('users').doc(_uid).update({
  //       'userCart': FieldValue.arrayUnion([
  //         {
  //           'cartId': cartId,
  //           'productId': productId,
  //           'quantity': quantity,
  //         }
  //       ])
  //     });
  //     await Fluttertoast.showToast(
  //       msg: "Item has been added to your cart",
  //       toastLength: Toast.LENGTH_SHORT,
  //       gravity: ToastGravity.CENTER,
  //     );
  //   } catch (error) {
  //     errorDialog(subtitle: error.toString(), context: context);
  //   }
  // }

  // static Future<void> addToWishlist(
  //     {required String productId, required BuildContext context}) async {
  //   final User? user = authInstance.currentUser;
  //   final _uid = user!.uid;
  //   final wishlistId = const Uuid().v4();
  //   try {
  //     FirebaseFirestore.instance.collection('users').doc(_uid).update({
  //       'userWish': FieldValue.arrayUnion([
  //         {
  //           'wishlistId': wishlistId,
  //           'productId': productId,
  //         }
  //       ])
  //     });
  //     await Fluttertoast.showToast(
  //       msg: "Item has been added to your wishlist",
  //       toastLength: Toast.LENGTH_SHORT,
  //       gravity: ToastGravity.CENTER,
  //     );
  //   } catch (error) {
  //     errorDialog(subtitle: error.toString(), context: context);
  //   }
  // }

  static Future<void> showAddressDialog({
    required BuildContext context,
    void Function(String)? onChanged,
    TextEditingController? controller,
    required void Function()? onPressed,
  }) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Update'),
          content: TextField(
            onChanged: onChanged,
            controller: controller,
            //controller: _addressTextController,
            maxLines: 5,
            decoration: const InputDecoration(hintText: "Your address"),
          ),
          actions: [
            TextButton(onPressed: onPressed, child: const Text('Update')),
          ],
        );
      },
    );
  }
}
