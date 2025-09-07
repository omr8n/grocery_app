import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/core/widgets/custom_text.dart';
import 'package:grocery_app/features/inner_screens/product_details_view.dart';

import '../../../core/helper/functions/global_methods.dart';
import '../../../core/utils/utils.dart';

class OrderItem extends StatefulWidget {
  const OrderItem({super.key});

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  late String orderDateToShow;

  @override
  void didChangeDependencies() {
    // final ordersModel = Provider.of<OrderModel>(context);
    // var orderDate = ordersModel.orderDate.toDate();
    // orderDateToShow = '${orderDate.day}/${orderDate.month}/${orderDate.year}';
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // final ordersModel = Provider.of<OrderModel>(context);
    // final Color color = Utils(context).color;
    Size size = Utils(context).getScreenSize;
    // final productProvider = Provider.of<ProductsProvider>(context);
    // final getCurrProduct = productProvider.findProdById(ordersModel.productId);
    return ListTile(
      // subtitle:
      //     Text('Paid: \$${double.parse(ordersModel.price).toStringAsFixed(2)}'),
      onTap: () {
        GlobalMethods.navigateTo(
          ctx: context,
          routeName: ProductDetailsView.routeName,
        );
      },
      leading: FancyShimmerImage(
        width: size.width * 0.2,
        // imageUrl: getCurrProduct.imageUrl,
        imageUrl:
            "https://m.media-amazon.com/images/I/61dV53UuRVS.__AC_SX300_SY300_QL70_FMwebp_.jpg",
        boxFit: BoxFit.fill,
      ),
      title: CustomText(
        // text: '${getCurrProduct.title}  x${ordersModel.quantity}',
        text: "fwe \$63",
        fontSize: 18,
      ),
      subtitle: Text('Paid: \$32'),
      trailing: CustomText(text: "orderDateToShow", fontSize: 18),
    );
  }
}
