// import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
// import 'package:flutter/material.dart';
// import 'package:grocery_app/core/widgets/custom_text.dart';
// import 'package:grocery_app/features/inner_screens/product_details_view.dart';

// import '../../../core/helper/functions/global_methods.dart';
// import '../../../core/utils/utils.dart';

// class OrderItem extends StatefulWidget {
//   const OrderItem({super.key});

//   @override
//   State<OrderItem> createState() => _OrderItemState();
// }

// class _OrderItemState extends State<OrderItem> {
//   late String orderDateToShow;

//   @override
//   void didChangeDependencies() {
//     // final ordersModel = Provider.of<OrderModel>(context);
//     // var orderDate = ordersModel.orderDate.toDate();
//     // orderDateToShow = '${orderDate.day}/${orderDate.month}/${orderDate.year}';
//     super.didChangeDependencies();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // final ordersModel = Provider.of<OrderModel>(context);
//     // final Color color = Utils(context).color;
//     Size size = Utils(context).getScreenSize;
//     // final productProvider = Provider.of<ProductsProvider>(context);
//     // final getCurrProduct = productProvider.findProdById(ordersModel.productId);
//     return ListTile(
//       // subtitle:
//       //     Text('Paid: \$${double.parse(ordersModel.price).toStringAsFixed(2)}'),
//       onTap: () {
//         GlobalMethods.navigateTo(
//           ctx: context,
//           routeName: ProductDetailsView.routeName,
//         );
//       },
//       leading: FancyShimmerImage(
//         width: size.width * 0.2,
//         // imageUrl: getCurrProduct.imageUrl,
//         imageUrl:
//             "https://m.media-amazon.com/images/I/61dV53UuRVS.__AC_SX300_SY300_QL70_FMwebp_.jpg",
//         boxFit: BoxFit.fill,
//       ),
//       title: CustomText(
//         // text: '${getCurrProduct.title}  x${ordersModel.quantity}',
//         text: "fwe \$63",
//         fontSize: 18,
//       ),
//       subtitle: Text('Paid: \$32'),
//       trailing: CustomText(text: "orderDateToShow", fontSize: 18),
//     );
//   }
// }

import 'package:cached_network_image/cached_network_image.dart';
// import 'package:e_commerce_shop_smart/core/entities/order_entity.dart';
// import 'package:e_commerce_shop_smart/core/models/order_model.dart';
// import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/core/entites/order_entity.dart';
// import 'package:grocery_app/core/entites/order_entity.dart';

// import '../../../core/constants/app_constants.dart';
// import '../../../core/widgets/subtitle_text.dart';
// import '../../../core/widgets/title_text.dart';

class OrderItem extends StatelessWidget {
  final OrderEntity order;

  const OrderItem({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Total Price
            Row(
              children: [
                Text(
                  'Total Price: \$${order.totalPrice.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const Spacer(),
                // Order Status
                // Container(
                //   padding: const EdgeInsets.symmetric(
                //     horizontal: 8,
                //     vertical: 4,
                //   ),
                //   decoration: BoxDecoration(
                //     color:
                //         orderModel.status == OrderStatusEnum.pending
                //             ? Colors.orange
                //             : orderModel.status == OrderStatusEnum.accepted
                //             ? Colors.green
                //             : orderModel.status == OrderStatusEnum.delivered
                //             ? Colors.blue
                //             : Colors.red,
                //     borderRadius: BorderRadius.circular(8),
                //   ),
                //   child: Text(
                //     orderModel.status.name,
                //     style: const TextStyle(fontSize: 14, color: Colors.white),
                //   ),
                // ),
              ],
            ),
            const SizedBox(height: 8),

            // User ID
            Text(
              'User ID: ${order.uId}',
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 8),

            // Shipping Address
            const Text(
              'Shipping Address:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),

            const SizedBox(height: 8),

            // Payment Method
            const SizedBox(height: 16),

            // Order Products
            const Text(
              'Products:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: order.orderProducts.length,
              itemBuilder: (context, index) {
                final product = order.orderProducts[index];
                return ListTile(
                  leading: CachedNetworkImage(
                    imageUrl: product.imageUrl,
                    placeholder: (context, url) => const SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                  title: Text(product.name),
                  subtitle: Text(
                    'Quantity: ${product.quantity} | Price: \$${product.price.toStringAsFixed(2)}',
                  ),
                  trailing: Text(
                    '\$${(product.price * product.quantity).toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 16),
            //   OrderActionButtons(orderEntity: orderModel),
          ],
        ),
      ),
    );
  }
}
