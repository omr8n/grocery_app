import 'package:flutter/material.dart';
import 'package:grocery_app/core/widgets/custom_text.dart';

class PriceItem extends StatelessWidget {
  const PriceItem({
    super.key,
    required this.salePrice,
    required this.price,
    required this.textPrice,
    required this.isOnSale,
  });
  final double salePrice, price;
  final String textPrice;
  final bool isOnSale;
  @override
  Widget build(BuildContext context) {
    //final Color color = Utils(context).color;
    double userPrice = isOnSale ? salePrice : price;
    return FittedBox(
        child: Row(
      children: [
        CustomText(
          //text: '\$${(userPrice).toStringAsFixed(2)}',
          text: '\$${(userPrice * int.parse(textPrice)).toStringAsFixed(2)}',
          color: Colors.green,
          fontSize: 18,
        ),
        const SizedBox(
          width: 8,
        ),
        Visibility(
          visible: isOnSale ? true : false,
          child: Text(
            // '\$${(userPrice).toStringAsFixed(2)}',
            '\$${(price * int.parse(textPrice)).toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: 15,

              //
              //   color: color,
              decoration: TextDecoration.lineThrough,
            ),
          ),
        ),
      ],
    ));
  }
}
