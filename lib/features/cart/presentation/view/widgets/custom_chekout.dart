// class CustomChekout extends StatelessWidget {
//   const CustomChekout({
//     super.key,
//     required this.totalPrice,
//     this.function,
//     this.isLoading = false,
//   });
//   final double totalPrice;
//   final VoidCallback? function;
//   final bool isLoading;
//   @override
//   Widget build(BuildContext context) {
//     Size size = Utils(context).getScreenSize;
//     return SizedBox(
//       width: double.infinity,
//       height: size.height * 0.1,
//       // color: ,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 12),
//         child: Row(
//           children: [
//             Material(
//               color: Colors.green,
//               borderRadius: BorderRadius.circular(10),
//               child: InkWell(
//                 borderRadius: BorderRadius.circular(10),
//                 // onTap: function,
//                 onTap: isLoading ? null : function,
//                 // onTap: () async {
//                 //   // User? user = authInstance.currentUser;
//                 //   // final orderId = const Uuid().v4();
//                 //   // final productProvider =
//                 //   //     Provider.of<ProductsProvider>(ctx, listen: false);

//                 //   // cartProvider.getCartItems.forEach((key, value) async {
//                 //   //   final getCurrProduct = productProvider.findProdById(
//                 //   //     value.productId,
//                 //   //   );
//                 //   //   try {
//                 //   //     await FirebaseFirestore.instance
//                 //   //         .collection('orders')
//                 //   //         .doc(orderId)
//                 //   //         .set({
//                 //   //       'orderId': orderId,
//                 //   //       'userId': user!.uid,
//                 //   //       'productId': value.productId,
//                 //   //       'price': (getCurrProduct.isOnSale
//                 //   //               ? getCurrProduct.salePrice
//                 //   //               : getCurrProduct.price) *
//                 //   //           value.quantity,
//                 //   //       'totalPrice': total,
//                 //   //       'quantity': value.quantity,
//                 //   //       'imageUrl': getCurrProduct.imageUrl,
//                 //   //       'userName': user.displayName,
//                 //   //       'orderDate': Timestamp.now(),
//                 //   //     });
//                 //   //     await cartProvider.clearOnlineCart();
//                 //   //     cartProvider.clearLocalCart();
//                 //   //     ordersProvider.fetchOrders();
//                 //   //     await Fluttertoast.showToast(
//                 //   //       msg: "Your order has been placed",
//                 //   //       toastLength: Toast.LENGTH_SHORT,
//                 //   //       gravity: ToastGravity.CENTER,
//                 //   //     );
//                 //   //   } catch (error) {
//                 //   //     GlobalMethods.errorDialog(
//                 //   //         subtitle: error.toString(), context: ctx);
//                 //   //   } finally {}
//                 //   // });
//                 // },
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: isLoading
//                       ? SizedBox(
//                           width: double.infinity,
//                           height: size.height * 0.1,
//                           child: const CircularProgressIndicator(
//                             color: Colors.white,
//                             strokeWidth: 2,
//                           ),
//                         )
//                       : CustomText(
//                           text: 'Order Now',
//                           fontSize: 20,
//                           color: Colors.white,
//                         ),
//                 ),
//               ),
//             ),
//             const Spacer(),
//             FittedBox(
//               child: CustomText(
//                 text: 'Total: \$${totalPrice.toStringAsFixed(2)}',

//                 // text: 'Total: \$32',
//                 fontSize: 18,
//                 isTitle: true,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

import '../../../../../core/utils/utils.dart';
import '../../../../../core/widgets/custom_text.dart';

class CustomChekout extends StatelessWidget {
  const CustomChekout({
    super.key,
    required this.totalPrice,
    this.function,
    this.isLoading = false,
  });

  final double totalPrice;
  final VoidCallback? function;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;

    return SizedBox(
      width: double.infinity,
      height: size.height * 0.1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: [
            SizedBox(
              height: 50,
              width: 150,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: isLoading ? null : function,
                child: isLoading
                    ? const SizedBox(
                        height: 24,
                        width: 24,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                      )
                    : const CustomText(
                        text: 'Order Now',
                        fontSize: 20,
                        color: Colors.white,
                      ),
              ),
            ),
            const Spacer(),
            FittedBox(
              child: CustomText(
                text: 'Total: \$${totalPrice.toStringAsFixed(2)}',
                fontSize: 18,
                isTitle: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
