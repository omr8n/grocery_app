import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../../../../core/helper/functions/global_methods.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../inner_screens/on_sale_view.dart';
import 'on_sale_item.dart';

class OnSaleSection extends StatelessWidget {
  const OnSaleSection({super.key});

  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    // final themeState = utils.getTheme;
    // final Color color = Utils(context).color;
    Size size = utils.getScreenSize;
    return Column(
      children: [
        TextButton(
          onPressed: () {
            GlobalMethods.navigateTo(
              ctx: context,
              routeName: OnSaleView.routeName,
            );
          },
          child: const CustomText(
            text: "View All",
            color: Colors.blue,
            fontSize: 15,
            isTitle: false,
          ),
        ),
        const SizedBox(height: 6),
        Row(
          children: [
            RotatedBox(
              quarterTurns: -1,
              child: Row(
                children: [
                  CustomText(
                    text: 'On sale'.toUpperCase(),
                    color: Colors.red,
                    fontSize: 22,
                  ),
                  const SizedBox(width: 5),
                  const Icon(IconlyLight.discount, color: Colors.red),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Flexible(
              child: SizedBox(
                height: size.height * 0.22,
                child: ListView.builder(
                  // itemCount: productsOnSale.length < 10
                  //     ? productsOnSale.length
                  //     : 10,
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, index) {
                    return const OnSaleItem();
                    // return ChangeNotifierProvider.value(
                    //     value: productsOnSale[index],
                    //     child: const OnSaleWidget());
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
