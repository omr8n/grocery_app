import 'package:flutter/material.dart';

import '../../../../../core/helper/functions/global_methods.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../inner_screens/product_view.dart';

class FeedsSection extends StatelessWidget {
  const FeedsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            text: 'Our products',
            //
            // color: color,
            fontSize: 22,
            isTitle: true,
            color: const Color.fromARGB(255, 55, 61, 153),
          ),
          // const Spacer(),
          TextButton(
            onPressed: () {
              GlobalMethods.navigateTo(
                ctx: context,
                routeName: ProductsView.routeName,
              );
            },
            child: CustomText(
              text: 'Browse all',
              color: Colors.blue,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
