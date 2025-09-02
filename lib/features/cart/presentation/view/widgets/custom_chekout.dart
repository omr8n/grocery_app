import 'package:flutter/material.dart';

import '../../../../../core/utils/utils.dart';
import '../../../../../core/widgets/custom_text.dart';

class CustomChekout extends StatelessWidget {
  const CustomChekout({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    return SizedBox(
      width: double.infinity,
      height: size.height * 0.1,
      // color: ,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(children: [
          Material(
            color: Colors.green,
            borderRadius: BorderRadius.circular(10),
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () async {
                // User? user = authInstance.currentUser;
                // final orderId = const Uuid().v4();
                // final productProvider =
                //     Provider.of<ProductsProvider>(ctx, listen: false);

                // cartProvider.getCartItems.forEach((key, value) async {
                //   final getCurrProduct = productProvider.findProdById(
                //     value.productId,
                //   );
                //   try {
                //     await FirebaseFirestore.instance
                //         .collection('orders')
                //         .doc(orderId)
                //         .set({
                //       'orderId': orderId,
                //       'userId': user!.uid,
                //       'productId': value.productId,
                //       'price': (getCurrProduct.isOnSale
                //               ? getCurrProduct.salePrice
                //               : getCurrProduct.price) *
                //           value.quantity,
                //       'totalPrice': total,
                //       'quantity': value.quantity,
                //       'imageUrl': getCurrProduct.imageUrl,
                //       'userName': user.displayName,
                //       'orderDate': Timestamp.now(),
                //     });
                //     await cartProvider.clearOnlineCart();
                //     cartProvider.clearLocalCart();
                //     ordersProvider.fetchOrders();
                //     await Fluttertoast.showToast(
                //       msg: "Your order has been placed",
                //       toastLength: Toast.LENGTH_SHORT,
                //       gravity: ToastGravity.CENTER,
                //     );
                //   } catch (error) {
                //     GlobalMethods.errorDialog(
                //         subtitle: error.toString(), context: ctx);
                //   } finally {}
                // });
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomText(
                  text: 'Order Now',
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const Spacer(),
          FittedBox(
            child: CustomText(
              //   text: 'Total: \$${total.toStringAsFixed(2)}',
              text: 'Total: \$32',

              fontSize: 18,
              isTitle: true,
            ),
          ),
        ]),
      ),
    );
  }
}
