import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:grocery_app/core/entites/order_entity.dart';

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
                // نحدد السعر الفعلي للعرض
                final displayPrice =
                    (product.isOnSale == true && product.onSale != null)
                    ? product.onSale!
                    : product.price;

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
                    'Quantity: ${product.quantity} | Price: \$${displayPrice.toStringAsFixed(2)}',
                  ),
                  trailing: Text(
                    '\$${(displayPrice * product.quantity).toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                );
              },
            ),

            // ListView.builder(
            //   shrinkWrap: true,
            //   physics: const NeverScrollableScrollPhysics(),
            //   itemCount: order.orderProducts.length,
            //   itemBuilder: (context, index) {
            //     final product = order.orderProducts[index];
            //     return ListTile(
            //       leading: CachedNetworkImage(
            //         imageUrl: product.imageUrl,
            //         placeholder: (context, url) => const SizedBox(
            //           width: 24,
            //           height: 24,
            //           child: CircularProgressIndicator(),
            //         ),
            //         errorWidget: (context, url, error) =>
            //             const Icon(Icons.error),
            //       ),
            //       title: Text(product.name),
            //       subtitle: Text(
            //         'Quantity: ${product.quantity} | Price: \$${product.price.toStringAsFixed(2)}',
            //       ),
            //       trailing: Text(
            //         '\$${(product.price * product.quantity).toStringAsFixed(2)}',
            //         style: const TextStyle(
            //           fontWeight: FontWeight.bold,
            //           color: Colors.green,
            //         ),
            //       ),
            //     );
            //   },
            // ),
            const SizedBox(height: 16),
            //   OrderActionButtons(orderEntity: orderModel),
          ],
        ),
      ),
    );
  }
}
